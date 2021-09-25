unit UExcecao;

interface

uses
  Forms, Windows, SysUtils, Classes, ComCtrls, Registry, Dialogs,
  Graphics, ClipBrd, jpeg, UInterface;

type
  TExcecao = class(TInterfacedObject, iExcecao)
  private
    function Print(Arquivo: String; Form: TForm): iExcecao;
    function Gravar(Sender: TObject; E: Exception): iExcecao;
  public
    constructor Create;
    destructor Destroy; override;

    class function New: iExcecao;
  end;

implementation

{ TExcecao }

const
  CNT_ARQUIVO = '%s.jpg';
  CNT_LOG     = 'log_erros.txt';

constructor TExcecao.Create;
begin

end;

destructor TExcecao.Destroy;
begin

  inherited;
end;

class function TExcecao.New: iExcecao;
begin
  Result := Self.Create;
end;

function TExcecao.Print(Arquivo: String; Form: TForm): iExcecao;
var
  Jpeg   : TJpegImage;
  Bitmap : TBitmap;
begin
  Result := Self;

  try
    Jpeg   := TJpegImage.Create;
    Bitmap := TBitmap.Create;

    try
      Bitmap.Assign(Form.GetFormImage);

      Jpeg.Assign(Bitmap);
      Jpeg.SaveTofile( Format(CNT_ARQUIVO, [Arquivo]) );

    finally
      Bitmap.Free;
      Jpeg.Free;
    end;

  except
  end;
end;

function TExcecao.Gravar(Sender: TObject; E: Exception): iExcecao;
var
  Txt : TextFile;
  Arq : String;
begin
  Result := Self;

  try
    AssignFile(Txt, CNT_LOG);

    if FileExists(CNT_LOG) then
      Append(Txt)
    else
      ReWrite(Txt);

    try
      Arq := FormatDateTime('dd-mm-yyyy_hh-nn-ss', Now);

      WriteLn(Txt, 'Data/Hora.......: ' + DateTimeToStr(Now));
      WriteLn(Txt, 'Classe Exceção..: ' + E.ClassName);
      WriteLn(Txt, 'Mensagem........: ' + E.Message);
      WriteLn(Txt, 'Formulário......: ' + Screen.ActiveForm.Name);
      WriteLn(Txt, 'Unit............: ' + (Sender As TComponent).Name);
      WriteLn(Txt, 'Controle Visual.: ' + Screen.ActiveControl.Name);
      WriteLn(Txt, 'Print Formulário: ' + Arq + '.jpg');
      WriteLn(Txt, StringOfChar('-', 50));

      Print(Arq, Screen.ActiveForm);

    finally
      CloseFile(Txt);
    end;

  except
  end;
end;

end.

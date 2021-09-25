unit UnitExemplo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, UExcecao;

type
  TFrmExemplo = class(TForm)
    btnErro: TButton;
    procedure btnErroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmExemplo: TFrmExemplo;

implementation

{$R *.dfm}

procedure TFrmExemplo.btnErroClick(Sender: TObject);
var E: Exception;
begin

  E := Exception.Create('Error Message');
  TExcecao.New.Gravar(Sender, E);

end;

end.

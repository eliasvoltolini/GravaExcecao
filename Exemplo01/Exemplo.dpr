program Exemplo;

uses
  Vcl.Forms,
  UnitExemplo in 'UnitExemplo.pas' {FrmExemplo},
  UExcecao in '..\UExcecao.pas',
  UInterface in '..\UInterface.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmExemplo, FrmExemplo);
  Application.Run;
end.

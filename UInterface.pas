unit UInterface;

interface

uses
  Forms, Sysutils;

type
  iExcecao = interface
    function Print(Arquivo: String; Form: TForm): iExcecao;
    function Gravar(Sender: TObject; E: Exception): iExcecao;
  end;

implementation

end.

program Fatelink;

uses
  Forms,
  AuthUnit in 'AuthUnit.pas',
  AddProductUnit in 'AddProductUnit.pas',
  MainUnit in 'MainUnit.pas',
  EditProductsUnit in 'EditProductsUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TAuthForm, AuthForm);
  Application.Run;
end.

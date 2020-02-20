unit AuthUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles, DB, ADODB, MainUnit;

type
  TAuthForm = class(TForm)
    descLabelLogin: TLabel;
    descLabelPassword: TLabel;
    editLogin: TEdit;
    editPassword: TEdit;
    cbShowPassword: TCheckBox;
    buttonAuth: TButton;
    cbSaveCredentials: TCheckBox;
    Connection: TADOConnection;
    TableUsers: TADOTable;
    AuthQuery: TADOQuery;
    DataSource: TDataSource;
    procedure cbShowPasswordClick(Sender: TObject);
    procedure buttonAuthClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AuthForm: TAuthForm;
  ConnectionString, Provider: widestring;

implementation

{$R *.dfm}

procedure TAuthForm.buttonAuthClick(Sender: TObject);
var
  ini:TIniFile;
begin
  Connection.ConnectionString:=ConnectionString;
  Connection.Provider:=Provider;

  Connection.Open();
  with AuthQuery do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM users WHERE username = :username AND password = :password;');
    Parameters.ParamByName('username').Value:=editLogin.Text;
    Parameters.ParamByName('password').Value:=editPassword.Text;
    Open;
  end;

  if AuthQuery.RecordCount = 1 then begin
    ini:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'settings.ini');
    try
      ini.WriteString('credentials', 'username', editLogin.text);
      ini.WriteString('credentials', 'password', editPassword.text);
    finally
      FreeAndNil(ini);
    end;

    AuthQuery.First;
    MainUnit.FUserID:=AuthQuery.Fields[0].AsInteger;

    //MessageDlg('”спешный вход! ¬аш ID - ' + IntToStr(MainUnit.FUserID), mtInformation, [mbOk], 0);

    Application.CreateForm(MainUnit.TMainForm, MainUnit.MainForm);
    //MainUnit.MainForm.Connection.ConnectionString:=Connection.ConnectionString;
    //MainUnit.MainForm.Connection.Provider:=Connection.Provider;
    MainUnit.MainForm.Show;
    Connection.Close;
    AuthForm.Hide;
    //AuthForm.Destroy;
  end
  else begin
    MessageDlg('¬ход не выполнен! Ќе найден пользователь с таким именем и (или) паролем', mtError, [mbRetry], 0);
    editPassword.Text:='';
  end;
end;

procedure TAuthForm.cbShowPasswordClick(Sender: TObject);
begin
  if cbShowPassword.Checked then editPassword.PasswordChar:=#0
  else editPassword.PasswordChar:='Х';
end;

procedure TAuthForm.FormCreate(Sender: TObject);
var
  ini:TIniFile;
begin
  ini:=TINIFile.Create(ExtractFilePath(Application.ExeName)+'settings.ini');
  try
    editLogin.Text:=ini.ReadString('credentials', 'username', '');
    editPassword.Text:=ini.ReadString('credentials', 'password', '');
    //FFileNameDB:=ini.ReadString('database', 'filename', ExtractFilePath(Application.ExeName)+'db.accdb');
    Provider:=ini.ReadString('database', 'provider', '');
    ConnectionString:=ini.ReadString('database', 'connection_string', '');
  finally
    FreeAndNil(ini);
  end;
end;

end.

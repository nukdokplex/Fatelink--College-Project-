unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, ExtCtrls, StdCtrls, AddProductUnit,
  EditProductsUnit, Menus;

type
  TMainForm = class(TForm)
    pnlGrid: TPanel;
    pnltools: TPanel;
    dbgrdMain: TDBGrid;
    conMain: TADOConnection;
    qryMain: TADOQuery;
    dsMain: TADODataSet;
    dsSourceMain: TDataSource;
    btnCreateProduct: TButton;
    btnNameFilter: TButton;
    btnPriceFilter: TButton;
    btnCountryFilter: TButton;
    btnEditProducts: TButton;
    mmMain: TMainMenu;
    F1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure conMainAfterConnect(Sender: TObject);
    procedure btnCreateProductClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEditProductsClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  FUserID: Integer;

implementation
uses AuthUnit;

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  //AuthUnit.AuthForm.Close;
  //AuthUnit.AuthForm.Free;
  conMain.LoginPrompt:=False;
  conMain.ConnectionString:=AuthUnit.ConnectionString;
  conMain.Provider:=AuthUnit.Provider;
  conMain.Open;
end;

procedure TMainForm.conMainAfterConnect(Sender: TObject);
begin
  qryMain.Connection:=conMain;
  qryMain.Close;
  dsSourceMain.DataSet:=qryMain;
  dbgrdMain.DataSource:=dsSourceMain;
  qryMain.Open;
  qryMain.Active:=true;
  dbgrdMain.Columns[0].Width:=24;
  dbgrdMain.Columns[1].Width:=64;
  dbgrdMain.Columns[2].Width:=312;
  dbgrdMain.Columns[3].Width:=64;
  dbgrdMain.Columns[4].Width:=64;
  dbgrdMain.Columns[5].Width:=80;
end;

procedure TMainForm.btnCreateProductClick(Sender: TObject);
begin
  Application.CreateForm(AddProductUnit.TAddProductForm, AddProductUnit.AddProductForm);
  AddProductUnit.AddProductForm.Show;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TMainForm.btnEditProductsClick(Sender: TObject);
begin
  Application.CreateForm(EditProductsUnit.TEditProductsForm, EditProductsUnit.EditProductsForm);
  EditProductsUnit.EditProductsForm.Show;
end;

procedure TMainForm.N1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMainForm.N3Click(Sender: TObject);
begin
  qryMain.Close;
  qryMain.Open;
  dbgrdMain.Refresh;

  dbgrdMain.Columns[0].Width:=24;
  dbgrdMain.Columns[1].Width:=64;
  dbgrdMain.Columns[2].Width:=312;
  dbgrdMain.Columns[3].Width:=64;
  dbgrdMain.Columns[4].Width:=64;
  dbgrdMain.Columns[5].Width:=80;
end;

end.

unit AddProductUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, ADODB;

type
  TAddProductForm = class(TForm)
    pnlCredentials: TPanel;
    pnlGrid: TPanel;
    lbl1: TLabel;
    edtProductName: TEdit;
    lbl2: TLabel;
    edtProductDescription: TEdit;
    lbl3: TLabel;
    edtPrice: TEdit;
    lbl4: TLabel;
    edtCountry: TEdit;
    btnAddProduct: TButton;
    qryProductList: TADOQuery;
    dsProductList: TDataSource;
    dbgrdProductList: TDBGrid;
    qryProductAdd: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnAddProductClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddProductForm: TAddProductForm;

implementation
uses MainUnit;

{$R *.dfm}

procedure SetGridColumnsWidth();
begin
  with AddProductForm do begin
    dbgrdProductList.Columns[0].Width:=312;
    dbgrdProductList.Columns[1].Width:=64;
    dbgrdProductList.Columns[2].Width:=64;
  end;
end;

procedure GridRefresh();
begin
  with AddProductForm do begin
    qryProductList.Close;
    qryProductList.Open;
    dbgrdProductList.Refresh;
  end;
end;

procedure TAddProductForm.FormCreate(Sender: TObject);
begin
  qryProductlist.Connection:=MainUnit.MainForm.conMain;
  qryProductList.Active:=True;

  qryProductAdd.Connection:=MainUnit.MainForm.conMain;

   SetGridColumnsWidth;
end;

procedure TAddProductForm.btnAddProductClick(Sender: TObject);
var
  product_id: Integer;
begin
  qryProductAdd.SQL.Clear;
  qryProductAdd.Close;
  qryProductAdd.SQL.Add('SELECT * FROM objects;');
  qryProductAdd.Open;

  qryProductAdd.Insert;
  qryProductAdd.FieldByName('creator_id').AsInteger:=MainUnit.FUserID;
  qryProductAdd.FieldByName('redactor_id').AsInteger:=MainUnit.FUserID;
  qryProductAdd.FieldByName('object_type').AsString:='product';
  qryProductAdd.FieldByName('object_title').AsString:=edtProductName.Text;
  qryProductAdd.FieldByName('object_description').AsString:=edtProductDescription.Text;
  qryProductAdd.Post;
  product_id:=qryProductAdd.FieldByName('id').AsInteger;

  qryProductAdd.SQL.Clear;
  qryProductAdd.Close;
  qryProductAdd.SQL.Add('SELECT * FROM objects_meta;');
  qryProductAdd.Open;

  qryProductAdd.Insert;
  qryProductAdd.FieldByName('object_id').AsInteger:=product_id;
  qryProductAdd.FieldByName('meta_name').AsString:='price';
  qryProductAdd.FieldByName('meta_data').AsString:=edtPrice.Text;
  qryProductAdd.Post;

  qryProductAdd.SQL.Clear;
  qryProductAdd.Close;
  qryProductAdd.SQL.Add('SELECT * FROM objects_meta;');
  qryProductAdd.Open;

  qryProductAdd.Insert;
  qryProductAdd.FieldByName('object_id').AsInteger:=product_id;
  qryProductAdd.FieldByName('meta_name').AsString:='country';
  qryProductAdd.FieldByName('meta_data').AsString:=edtCountry.Text;
  qryProductAdd.Post;

  qryProductAdd.SQL.Clear;
  qryProductAdd.Close;

  GridRefresh;
  SetGridColumnsWidth;
end;

procedure TAddProductForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(AddProductForm);
end;

end.

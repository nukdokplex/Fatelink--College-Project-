unit EditProductsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids, ExtCtrls;

type
  TEditProductsForm = class(TForm)
    pnlCredentials: TPanel;
    lbl1: TLabel;
    edtProductName: TEdit;
    lbl2: TLabel;
    edtProductDescription: TEdit;
    lbl3: TLabel;
    edtPrice: TEdit;
    lbl4: TLabel;
    edtCountry: TEdit;
    pnlGrid: TPanel;
    dbgrdProductList: TDBGrid;
    btnEditProduct: TButton;
    qryProductList: TADOQuery;
    dsProductList: TDataSource;
    qryEditProduct: TADOQuery;
    btnDeleteProduct: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrdProductListKeyPress(Sender: TObject; var Key: Char);
    procedure dbgrdProductListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrdProductListCellClick(Column: TColumn);
    procedure btnEditProductClick(Sender: TObject);
    procedure btnDeleteProductClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditProductsForm: TEditProductsForm;
  SelectedID: Integer;

implementation
uses MainUnit;

{$R *.dfm}

procedure RefreshGrid();
begin
  with EditProductsForm do begin
    qryProductList.Close;
    qryProductList.Open;
    dbgrdProductList.Refresh;
  end;
end;

procedure SetGridColumnsWidth();
begin
  with EditProductsForm do begin
    dbgrdProductList.Columns[0].Width:=24;
    dbgrdProductList.Columns[1].Width:=64;
    dbgrdProductList.Columns[2].Width:=312;
    dbgrdProductList.Columns[3].Width:=64;
    dbgrdProductList.Columns[4].Width:=64;
    dbgrdProductList.Columns[5].Width:=80;
    dbgrdProductList.Columns[6].Width:=0;
  end;
end;

procedure TEditProductsForm.FormCreate(Sender: TObject);
begin
  qryProductlist.Connection:=MainUnit.MainForm.conMain;
  qryProductList.Active:=True;

  qryEditProduct.Connection:=MainUnit.MainForm.conMain;
 // qryEditProduct.Active:=True;

  SetGridColumnsWidth;
end;

procedure TEditProductsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(EditProductsForm);
end;

procedure TEditProductsForm.dbgrdProductListKeyPress(Sender: TObject;
  var Key: Char);
begin
  SelectedID:=dbgrdProductList.Fields[0].AsInteger;
  edtProductName.Text:=dbgrdProductList.Fields[2].AsString;
  edtProductDescription.Text:=dbgrdProductList.Fields[6].AsString;
  edtPrice.Text:=dbgrdProductList.Fields[4].AsString;
  edtCountry.Text:=dbgrdProductList.Fields[5].AsString;
end;

procedure TEditProductsForm.dbgrdProductListKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  SelectedID:=dbgrdProductList.Fields[0].AsInteger;
  edtProductName.Text:=dbgrdProductList.Fields[2].AsString;
  edtProductDescription.Text:=dbgrdProductList.Fields[6].AsString;
  edtPrice.Text:=dbgrdProductList.Fields[4].AsString;
  edtCountry.Text:=dbgrdProductList.Fields[5].AsString;
end;

procedure TEditProductsForm.dbgrdProductListCellClick(Column: TColumn);
begin
  SelectedID:=dbgrdProductList.Fields[0].AsInteger;
  edtProductName.Text:=dbgrdProductList.Fields[2].AsString;
  edtProductDescription.Text:=dbgrdProductList.Fields[6].AsString;
  edtPrice.Text:=dbgrdProductList.Fields[4].AsString;
  edtCountry.Text:=dbgrdProductList.Fields[5].AsString;
end;

procedure TEditProductsForm.btnEditProductClick(Sender: TObject);
begin
  with qryEditProduct do begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE objects SET object_title = :title, object_description = :desc, redactor_id = :rid WHERE id = :id;');
    Parameters.ParamByName('id').Value:=SelectedID;
    Parameters.ParamByName('title').Value:=edtProductName.Text;
    Parameters.ParamByName('desc').Value:=edtProductDescription.Text;
    Parameters.ParamByName('rid').Value:=MainUnit.FUserID;
    ExecSQL;
    //Open;

    Close;
    SQL.Clear;
    SQL.Add('SELECT TOP 1 * FROM objects_meta WHERE object_id = :id AND meta_name="price";');
    Parameters.ParamByName('id').Value:=SelectedID;
    Open;

    if RecordCount >=1 then begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE objects_meta SET meta_data = :data WHERE object_id = :id AND meta_name="price";');
      Parameters.ParamByName('id').Value:=SelectedID;
      Parameters.ParamByName('data').Value:=edtPrice.Text;
      ExecSQL;
      //Open;

    end
    else begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO objects_meta(object_id, meta_name, meta_data) VALUES (:object_id, "price", :meta_data);');
      Parameters.ParamByName('object_id').Value:=SelectedID;
      Parameters.ParamByName('meta_data').Value:=edtPrice.Text;
      //Open;
      execsql;
    end;

    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM objects_meta WHERE object_id = :id AND meta_name="country";');
    Parameters.ParamByName('id').Value:=SelectedID;
    Open;

    if RecordCount >=1 then begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE objects_meta SET meta_data = :data WHERE object_id = :id AND meta_name="country";');
      Parameters.ParamByName('id').Value:=SelectedID;
      Parameters.ParamByName('data').Value:=edtCountry.Text;
      ExecSQL;
      //Open;

    end
    else begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO objects_meta(object_id, meta_name, meta_data) VALUES (:object_id, "country", :meta_data);');
      Parameters.ParamByName('object_id').Value:=SelectedID;
      Parameters.ParamByName('meta_data').Value:=edtCountry.Text;
      //Open;
      execsql;
    end;
    Close;
    SQL.Clear;
  end;
  RefreshGrid;
  SetGridColumnsWidth;
end;

procedure TEditProductsForm.btnDeleteProductClick(Sender: TObject);
begin
  with qryEditProduct do begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM objects_meta WHERE object_id = :id;');
    Parameters.ParamByName('id').Value:=SelectedID;
    ExecSQL;

    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM objects WHERE id = :id;');
    Parameters.ParamByName('id').Value:=SelectedID;
    ExecSQL;
  end;

  RefreshGRid;
  SetGridColumnsWidth;
end;

end.

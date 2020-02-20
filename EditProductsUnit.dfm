object EditProductsForm: TEditProductsForm
  Left = 1239
  Top = 526
  Width = 724
  Height = 657
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCredentials: TPanel
    Left = 0
    Top = 0
    Width = 708
    Height = 217
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 16
      Top = 16
      Width = 140
      Height = 16
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072': '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 16
      Top = 48
      Width = 62
      Height = 16
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl3: TLabel
      Left = 16
      Top = 80
      Width = 35
      Height = 16
      Caption = #1062#1077#1085#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 16
      Top = 112
      Width = 47
      Height = 16
      Caption = #1057#1090#1088#1072#1085#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtProductName: TEdit
      Left = 168
      Top = 16
      Width = 529
      Height = 21
      TabOrder = 0
    end
    object edtProductDescription: TEdit
      Left = 168
      Top = 48
      Width = 529
      Height = 21
      TabOrder = 1
    end
    object edtPrice: TEdit
      Left = 168
      Top = 80
      Width = 169
      Height = 21
      TabOrder = 2
    end
    object edtCountry: TEdit
      Left = 168
      Top = 112
      Width = 169
      Height = 21
      TabOrder = 3
    end
    object btnEditProduct: TButton
      Left = 8
      Top = 152
      Width = 329
      Height = 49
      Caption = #1042#1085#1077#1089#1090#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnEditProductClick
    end
    object btnDeleteProduct: TButton
      Left = 368
      Top = 152
      Width = 329
      Height = 49
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1058#1086#1074#1072#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = btnDeleteProductClick
    end
  end
  object pnlGrid: TPanel
    Left = 0
    Top = 217
    Width = 708
    Height = 401
    Align = alClient
    TabOrder = 1
    object dbgrdProductList: TDBGrid
      Left = 1
      Top = 1
      Width = 706
      Height = 399
      Align = alClient
      DataSource = dsProductList
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbgrdProductListCellClick
      OnKeyDown = dbgrdProductListKeyDown
      OnKeyPress = dbgrdProductListKeyPress
      OnKeyUp = dbgrdProductListKeyDown
    end
  end
  object qryProductList: TADOQuery
    Parameters = <>
    SQL.Strings = (
      
        'SELECT objects.id AS [ID], objects.creator_id AS ['#1057#1086#1079#1076#1072#1090#1077#1083#1100'], ob' +
        'jects.object_title AS ['#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072'], objects.redactor_id' +
        ' AS ['#1056#1077#1076#1072#1082#1090#1086#1088'], (SELECT objects_meta.meta_data FROM objects_meta' +
        ' WHERE meta_name = '#39'price'#39' AND object_id = objects.id) AS ['#1062#1077#1085#1072']' +
        ', (SELECT objects_meta.meta_data FROM objects_meta WHERE meta_na' +
        'me = '#39'country'#39' AND object_id = objects.id) AS ['#1057#1090#1088#1072#1085#1072'], objects.' +
        'object_description'
      'FROM objects'
      'WHERE (((objects.object_type)='#39'product'#39'));')
    Left = 184
    Top = 360
  end
  object dsProductList: TDataSource
    AutoEdit = False
    DataSet = qryProductList
    Left = 384
    Top = 336
  end
  object qryEditProduct: TADOQuery
    Parameters = <>
    Left = 352
    Top = 312
  end
end

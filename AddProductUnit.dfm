object AddProductForm: TAddProductForm
  Left = 738
  Top = 235
  Width = 568
  Height = 535
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1090#1086#1074#1072#1088#1086#1074
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
    Width = 552
    Height = 208
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
      Left = 160
      Top = 16
      Width = 385
      Height = 21
      TabOrder = 0
    end
    object edtProductDescription: TEdit
      Left = 160
      Top = 48
      Width = 385
      Height = 21
      TabOrder = 1
    end
    object edtPrice: TEdit
      Left = 160
      Top = 80
      Width = 169
      Height = 21
      TabOrder = 2
    end
    object edtCountry: TEdit
      Left = 160
      Top = 112
      Width = 169
      Height = 21
      TabOrder = 3
    end
    object btnAddProduct: TButton
      Left = 8
      Top = 152
      Width = 537
      Height = 49
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1086#1074#1072#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnAddProductClick
    end
  end
  object pnlGrid: TPanel
    Left = 0
    Top = 208
    Width = 552
    Height = 288
    Align = alClient
    TabOrder = 1
    object dbgrdProductList: TDBGrid
      Left = 1
      Top = 1
      Width = 550
      Height = 286
      Align = alClient
      DataSource = dsProductList
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object qryProductList: TADOQuery
    Parameters = <>
    SQL.Strings = (
      
        'SELECT objects.object_title AS ['#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072'], (SELECT ob' +
        'jects_meta.meta_data FROM objects_meta WHERE meta_name = '#39'price'#39 +
        ' AND object_id = objects.id) AS ['#1062#1077#1085#1072'], (SELECT objects_meta.met' +
        'a_data FROM objects_meta WHERE meta_name = '#39'country'#39' AND object_' +
        'id = objects.id) AS ['#1057#1090#1088#1072#1085#1072']'
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
  object qryProductAdd: TADOQuery
    Parameters = <>
    Left = 400
    Top = 96
  end
end

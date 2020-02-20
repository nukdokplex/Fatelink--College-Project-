object MainForm: TMainForm
  Left = 1204
  Top = 183
  Width = 674
  Height = 405
  Caption = 'Fatelink'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMain
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlGrid: TPanel
    Left = 0
    Top = 0
    Width = 658
    Height = 268
    Align = alClient
    TabOrder = 0
    object dbgrdMain: TDBGrid
      Left = 1
      Top = 1
      Width = 656
      Height = 266
      Align = alClient
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object pnltools: TPanel
    Left = 0
    Top = 268
    Width = 658
    Height = 78
    Align = alBottom
    TabOrder = 1
    object btnCreateProduct: TButton
      Left = 8
      Top = 8
      Width = 137
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1090#1086#1074#1072#1088#1086#1074
      TabOrder = 0
      OnClick = btnCreateProductClick
    end
    object btnNameFilter: TButton
      Left = 176
      Top = 8
      Width = 137
      Height = 25
      Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1085#1072#1079#1074#1072#1085#1080#1102
      TabOrder = 1
    end
    object btnPriceFilter: TButton
      Left = 344
      Top = 8
      Width = 137
      Height = 25
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1094#1077#1085#1077
      TabOrder = 2
    end
    object btnCountryFilter: TButton
      Left = 512
      Top = 8
      Width = 137
      Height = 25
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1089#1090#1088#1072#1085#1077
      TabOrder = 3
    end
    object btnEditProducts: TButton
      Left = 8
      Top = 40
      Width = 641
      Height = 25
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1086#1074
      TabOrder = 4
      OnClick = btnEditProductsClick
    end
  end
  object conMain: TADOConnection
    Mode = cmShareDenyNone
    AfterConnect = conMainAfterConnect
    Left = 248
    Top = 144
  end
  object qryMain: TADOQuery
    Parameters = <>
    SQL.Strings = (
      
        'SELECT objects.id AS [ID], objects.creator_id AS ['#1057#1086#1079#1076#1072#1090#1077#1083#1100'], ob' +
        'jects.object_title AS ['#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072'], objects.redactor_id' +
        ' AS ['#1056#1077#1076#1072#1082#1090#1086#1088'], (SELECT objects_meta.meta_data FROM objects_meta' +
        ' WHERE meta_name = '#39'price'#39' AND object_id = objects.id) AS ['#1062#1077#1085#1072']' +
        ', (SELECT objects_meta.meta_data FROM objects_meta WHERE meta_na' +
        'me = '#39'country'#39' AND object_id = objects.id) AS ['#1057#1090#1088#1072#1085#1072']'
      'FROM objects'
      'WHERE (((objects.object_type)='#39'product'#39'));')
    Left = 432
    Top = 160
  end
  object dsMain: TADODataSet
    Parameters = <>
    Left = 360
    Top = 104
  end
  object dsSourceMain: TDataSource
    Left = 144
    Top = 168
  end
  object mmMain: TMainMenu
    Left = 312
    Top = 80
    object F1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N1: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100
        ShortCut = 49240
        OnClick = N1Click
      end
    end
    object N2: TMenuItem
      Caption = #1041#1044
      object N3: TMenuItem
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
        ShortCut = 116
        OnClick = N3Click
      end
    end
  end
end

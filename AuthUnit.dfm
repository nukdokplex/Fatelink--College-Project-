object AuthForm: TAuthForm
  Left = 747
  Top = 254
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103' - Fatelink'
  ClientHeight = 259
  ClientWidth = 305
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object descLabelLogin: TLabel
    Left = 39
    Top = 64
    Width = 34
    Height = 13
    Caption = #1051#1086#1075#1080#1085':'
  end
  object descLabelPassword: TLabel
    Left = 32
    Top = 104
    Width = 41
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100':'
  end
  object editLogin: TEdit
    Left = 96
    Top = 61
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object editPassword: TEdit
    Left = 96
    Top = 101
    Width = 121
    Height = 21
    PasswordChar = #8226
    TabOrder = 1
  end
  object cbShowPassword: TCheckBox
    Left = 96
    Top = 128
    Width = 121
    Height = 17
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1072#1088#1086#1083#1100
    TabOrder = 2
    OnClick = cbShowPasswordClick
  end
  object buttonAuth: TButton
    Left = 96
    Top = 189
    Width = 121
    Height = 25
    Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
    TabOrder = 3
    OnClick = buttonAuthClick
  end
  object cbSaveCredentials: TCheckBox
    Left = 96
    Top = 220
    Width = 129
    Height = 17
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
    TabOrder = 4
  end
  object Connection: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.ACE.OLEDB.16.0;Data Source=C:\Users\NukDo\Des' +
      'ktop\Fatelink\db.accdb;Persist Security Info=False'
    LoginPrompt = False
    Provider = 'Microsoft.ACE.OLEDB.16.0'
    Left = 272
    Top = 32
  end
  object TableUsers: TADOTable
    Connection = Connection
    TableName = 'users'
    Left = 272
    Top = 64
  end
  object AuthQuery: TADOQuery
    Connection = Connection
    DataSource = DataSource
    Parameters = <>
    Left = 272
    Top = 96
  end
  object DataSource: TDataSource
    DataSet = TableUsers
    Left = 272
  end
end

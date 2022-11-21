object fmBD: TfmBD
  Left = 0
  Top = 44
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderIcons = []
  BorderStyle = bsNone
  Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1041#1044
  ClientHeight = 673
  ClientWidth = 1016
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object book_bd: TNotebook
    Left = 0
    Top = 0
    Width = 1016
    Height = 621
    Align = alClient
    PageIndex = 3
    TabOrder = 0
    object TPage
      Left = 0
      Top = 0
      Caption = 'Default'
      object DBGrid01: TDBGrid
        Tag = 1
        Left = 0
        Top = 0
        Width = 1016
        Height = 621
        Align = alClient
        DataSource = DM.ds_bd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid01DrawColumnCell
        OnMouseMove = DBGrid02MouseMove
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'doz_suh'
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 1016
        Height = 621
        Align = alClient
        TabOrder = 0
        object DBGrid02: TDBGrid
          Tag = 2
          Left = 1
          Top = 1
          Width = 1014
          Height = 619
          Align = alClient
          DataSource = DM.ds_bd
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clPurple
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGrid01DrawColumnCell
          OnMouseMove = DBGrid02MouseMove
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'doz_mokr'
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 1016
        Height = 621
        Align = alClient
        Caption = 'Panel4'
        TabOrder = 0
        object DBGrid03: TDBGrid
          Tag = 3
          Left = 1
          Top = 1
          Width = 1014
          Height = 619
          Align = alClient
          DataSource = DM.ds_bd
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clGreen
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGrid01DrawColumnCell
          OnMouseMove = DBGrid02MouseMove
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'pudra_past'
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 1016
        Height = 621
        Align = alClient
        Caption = 'Panel5'
        TabOrder = 0
        object DBGrid04: TDBGrid
          Tag = 4
          Left = 1
          Top = 1
          Width = 1014
          Height = 619
          Align = alClient
          DataSource = DM.ds_bd
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clTeal
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGrid01DrawColumnCell
          OnMouseMove = DBGrid02MouseMove
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'a1'
      object DBGrid05: TDBGrid
        Tag = 5
        Left = 0
        Top = 0
        Width = 1016
        Height = 621
        Align = alClient
        DataSource = DM.ds_bd_a1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clPurple
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid01DrawColumnCell
        OnMouseMove = DBGrid02MouseMove
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'a2'
      object DBGrid06: TDBGrid
        Tag = 6
        Left = 0
        Top = 0
        Width = 1016
        Height = 621
        Align = alClient
        DataSource = DM.ds_bd_a2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid01DrawColumnCell
        OnMouseMove = DBGrid02MouseMove
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'a3'
      object DBGrid07: TDBGrid
        Tag = 7
        Left = 0
        Top = 0
        Width = 1016
        Height = 621
        Align = alClient
        DataSource = DM.ds_bd_a3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid01DrawColumnCell
        OnMouseMove = DBGrid02MouseMove
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'a4'
      object DBGrid08: TDBGrid
        Tag = 8
        Left = 0
        Top = 0
        Width = 1016
        Height = 621
        Align = alClient
        DataSource = DM.ds_bd_a4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlue
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid01DrawColumnCell
        OnMouseMove = DBGrid02MouseMove
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'a5'
      object DBGrid09: TDBGrid
        Tag = 8
        Left = 0
        Top = 0
        Width = 1016
        Height = 621
        Align = alClient
        DataSource = DM.ds_bd_a5
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlue
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid01DrawColumnCell
        OnMouseMove = DBGrid02MouseMove
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'a6'
      object DBGrid10: TDBGrid
        Tag = 8
        Left = 0
        Top = 0
        Width = 1016
        Height = 621
        Align = alClient
        DataSource = DM.ds_bd_a6
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlue
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnMouseMove = DBGrid02MouseMove
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 621
    Width = 1016
    Height = 52
    Align = alBottom
    Caption = 'Panel1'
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 1
    object Panel2: TPanel
      Left = 1
      Top = -1
      Width = 1014
      Height = 52
      Align = alBottom
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        Left = 443
        Top = 13
        Width = 90
        Height = 23
        Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1041#1044' '#1079#1072' '#1090#1077#1082#1091#1097#1091#1102' '#1076#1072#1090#1091
        BiDiMode = bdLeftToRight
        Caption = #1058#1077#1082#1091#1097#1072#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ParentBiDiMode = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 116
        Top = 13
        Width = 90
        Height = 23
        Hint = #1047#1072#1075#1088#1091#1079#1082#1072' '#1090#1072#1073#1083#1080#1094#1099' '#1041#1044' '#1079#1072' '#1074#1074#1077#1076#1077#1085#1085#1091#1102' '#1076#1072#1090#1091
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton2Click
      end
      object SpeedButton3: TSpeedButton
        Left = 321
        Top = 13
        Width = 90
        Height = 23
        Hint = #1055#1077#1088#1077#1081#1090#1080' '#1074' '#1090#1072#1073#1083#1080#1094#1077' '#1041#1044' '#1085#1072' '#1074#1074#1077#1076#1077#1085#1085#1086#1077' '#1074#1088#1077#1084#1103
        Caption = #1055#1077#1088#1077#1081#1090#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton3Click
      end
      object SpeedButton4: TSpeedButton
        Tag = 4
        Left = 566
        Top = 13
        Width = 23
        Height = 23
        Hint = #1055#1077#1088#1077#1093#1086#1076' '#1082' '#1087#1077#1088#1074#1086#1081' '#1079#1072#1087#1080#1089#1080' '#1041#1044
        Caption = '|<'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton4Click
      end
      object SpeedButton5: TSpeedButton
        Tag = 5
        Left = 594
        Top = 13
        Width = 23
        Height = 23
        Hint = #1055#1077#1088#1077#1093#1086#1076' '#1082' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1079#1072#1087#1080#1089#1080' '#1041#1044
        Caption = '>|'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton4Click
      end
      object date1: TDateEdit
        Left = 13
        Top = 14
        Width = 95
        Height = 21
        Hint = #1042#1074#1086#1076' '#1076#1072#1090#1099' '#1076#1083#1103' '#1079#1072#1075#1088#1091#1079#1082#1080' '#1090#1072#1073#1083#1080#1094#1099' '#1041#1044
        DefaultToday = True
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnChange = date1Enter
      end
      object tm: TDateTimePicker
        Left = 238
        Top = 14
        Width = 73
        Height = 21
        Hint = #1042#1074#1074#1086#1076' '#1074#1088#1077#1084#1077#1085#1080' '#1076#1083#1103' '#1087#1077#1088#1077#1093#1086#1076#1072' '#1074' '#1090#1072#1073#1083#1080#1094#1077' '#1041#1044
        Date = 38331.660649444440000000
        Time = 38331.660649444440000000
        Kind = dtkTime
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnChange = tmEnter
      end
    end
  end
  object TNQ: TIBQuery
    Database = DM.IBDatabase1
    Transaction = DM.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT RDB$RELATION_NAME FROM RDB$RELATIONS')
    Left = 17
    Top = 52
  end
end

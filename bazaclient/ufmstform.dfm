object fmStForm: TfmStForm
  Left = 191
  Top = 105
  Align = alTop
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1040#1057#1059' '#1058#1055' - '#1082#1083#1080#1077#1085#1090
  ClientHeight = 462
  ClientWidth = 926
  Color = clAppWorkSpace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  KeyPreview = True
  Menu = M1
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  OnCreate = FormCreate
  OnDestroy = F101Click
  OnMouseMove = FormMouseMove
  OnPaint = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 430
    Width = 926
    Height = 21
    Panels = <
      item
        Width = 450
      end
      item
        Width = 70
      end
      item
        Width = 70
      end
      item
        Width = 110
      end
      item
        Width = 50
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 926
    Height = 29
    ButtonHeight = 20
    ButtonWidth = 77
    Caption = 'ToolBar1'
    Color = clActiveBorder
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    ParentColor = False
    TabOrder = 1
    OnMouseMove = FormMouseMove
    object SpeedButton14: TSpeedButton
      Left = 0
      Top = 2
      Width = 23
      Height = 20
      Hint = #1052#1085#1077#1084#1086#1089#1093#1077#1084#1072' '#1072#1074#1090#1086#1082#1083#1072#1074#1086#1074
      Caption = #1040
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = N4Click
      OnMouseMove = FormMouseMove
    end
    object SpeedButton15: TSpeedButton
      Left = 23
      Top = 2
      Width = 23
      Height = 20
      Hint = #1052#1085#1077#1084#1086#1089#1093#1077#1084#1072' '#1076#1086#1079#1080#1088#1086#1074#1082#1080' 1'
      Caption = #1044'1'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = N3Click
      OnMouseMove = FormMouseMove
    end
    object SpeedButton16: TSpeedButton
      Left = 46
      Top = 2
      Width = 23
      Height = 20
      Hint = #1052#1085#1077#1084#1086#1089#1093#1077#1084#1072' '#1076#1086#1079#1080#1088#1086#1074#1082#1080' 2'
      Caption = #1044'2'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = N33Click
      OnMouseMove = FormMouseMove
    end
    object ToolButton1: TToolButton
      Left = 69
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
      OnMouseMove = FormMouseMove
    end
    object SpeedButton1: TSpeedButton
      Left = 77
      Top = 2
      Width = 25
      Height = 20
      Hint = #1043#1088#1072#1092#1080#1082' '#1090#1077#1084#1087#1077#1088#1072#1090#1091#1088' '#1076#1086#1079#1080#1088#1086#1074#1082#1080' 1'
      Caption = #1058#1044'1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clFuchsia
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = N11Click
      OnMouseMove = FormMouseMove
    end
    object SpeedButton2: TSpeedButton
      Left = 102
      Top = 2
      Width = 25
      Height = 20
      Hint = #1043#1088#1072#1092#1080#1082' '#1090#1077#1084#1087#1077#1088#1072#1090#1091#1088' '#1076#1086#1079#1080#1088#1086#1074#1082#1080' 2'
      Caption = #1058#1044'2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clFuchsia
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = N111Click
      OnMouseMove = FormMouseMove
    end
    object SpeedButton3: TSpeedButton
      Left = 127
      Top = 2
      Width = 23
      Height = 20
      Hint = #1043#1088#1072#1092#1080#1082' '#1074#1077#1089#1072' '#1076#1086#1079#1072#1090#1086#1088#1072' '#1089#1091#1093#1086#1075#1086' '#1080' '#1084#1086#1082#1088#1086#1075#1086
      Caption = #1057#1052
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = N21Click
      OnMouseMove = FormMouseMove
    end
    object SpeedButton9: TSpeedButton
      Left = 150
      Top = 2
      Width = 23
      Height = 20
      Hint = #1043#1088#1072#1092#1080#1082' '#1074#1077#1089#1072' '#1076#1086#1079#1072#1090#1086#1088#1072'  '#1087#1072#1089#1090#1099
      Caption = #1055#1055
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton9Click
      OnMouseMove = FormMouseMove
    end
    object ToolButton3: TToolButton
      Left = 173
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsSeparator
      OnMouseMove = FormMouseMove
    end
    object SpeedButton4: TSpeedButton
      Left = 181
      Top = 2
      Width = 23
      Height = 20
      Hint = #1043#1088#1072#1092#1080#1082' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' '#1072#1074#1090#1086#1082#1083#1072#1074#1072' N1'
      Caption = #1040'1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = N31Click
      OnMouseMove = FormMouseMove
    end
    object SpeedButton5: TSpeedButton
      Left = 204
      Top = 2
      Width = 23
      Height = 20
      Hint = #1043#1088#1072#1092#1080#1082' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' '#1072#1074#1090#1086#1082#1083#1072#1074#1072' N2'
      Caption = #1040'2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = N41Click
      OnMouseMove = FormMouseMove
    end
    object SpeedButton6: TSpeedButton
      Left = 227
      Top = 2
      Width = 23
      Height = 20
      Hint = #1043#1088#1072#1092#1080#1082' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' '#1072#1074#1090#1086#1082#1083#1072#1074#1072' N3'
      Caption = #1040'3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = N51Click
      OnMouseMove = FormMouseMove
    end
    object SpeedButton12: TSpeedButton
      Left = 250
      Top = 2
      Width = 23
      Height = 20
      Hint = #1043#1088#1072#1092#1080#1082' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' '#1072#1074#1090#1086#1082#1083#1072#1074#1072' N4'
      Caption = #1040'4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = N45Click
      OnMouseMove = FormMouseMove
    end
    object SpeedButton13: TSpeedButton
      Left = 273
      Top = 2
      Width = 23
      Height = 20
      Hint = #1043#1088#1072#1092#1080#1082' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' '#1072#1074#1090#1086#1082#1083#1072#1074#1072' N5'
      Caption = #1040'5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = N46Click
      OnMouseMove = FormMouseMove
    end
    object SpeedButton7: TSpeedButton
      Left = 296
      Top = 2
      Width = 23
      Height = 20
      Hint = #1043#1088#1072#1092#1080#1082' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' '#1072#1074#1090#1086#1082#1083#1072#1074#1072' N6'
      Caption = #1040'6'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = N47Click
      OnMouseMove = FormMouseMove
    end
    object ToolButton6: TToolButton
      Left = 319
      Top = 2
      Width = 38
      Caption = 'ToolButton6'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object SpeedButton11: TSpeedButton
      Left = 357
      Top = 2
      Width = 23
      Height = 20
      Hint = #1055#1077#1088#1077#1082#1083#1102#1095#1077#1085#1080#1077' '#1085#1072' '#1092#1086#1088#1084#1091' '#1079#1072#1087#1088#1086#1089#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1086#1090#1095#1077#1090#1072
      Caption = #1054#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton11Click
      OnMouseMove = FormMouseMove
    end
    object SpeedButton8: TSpeedButton
      Left = 380
      Top = 2
      Width = 23
      Height = 20
      Hint = #1055#1088#1077#1088#1074#1072#1090#1100' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1086#1090#1095#1077#1090#1072
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton8Click
      OnMouseMove = FormMouseMove
    end
    object SpeedButton10: TSpeedButton
      Left = 403
      Top = 2
      Width = 94
      Height = 20
      Caption = #1055#1086#1076#1082#1083'. '#1082' '#1041#1044
      ParentShowHint = False
      ShowHint = True
      Transparent = False
      Visible = False
      OnClick = SpeedButton10Click
      OnMouseMove = FormMouseMove
    end
    object ToolButton5: TToolButton
      Left = 497
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object Shape1: TShape
      Left = 505
      Top = 2
      Width = 20
      Height = 20
      Align = alRight
      Brush.Color = clActiveBorder
      ParentShowHint = False
      Shape = stCircle
      ShowHint = False
    end
    object ToolButton4: TToolButton
      Left = 525
      Top = 2
      Width = 10
      ImageIndex = 1
      Style = tbsSeparator
    end
    object PCCSFL: TLabel
      Left = 535
      Top = 2
      Width = 90
      Height = 20
      Align = alRight
      AutoSize = False
      Caption = '0 1 2 3 4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 451
    Width = 926
    Height = 11
    Align = alBottom
    AutoSize = True
    TabOrder = 2
  end
  object M1: TMainMenu
    OwnerDraw = True
    Left = 11
    Top = 40
    object N2: TMenuItem
      Tag = 2
      Caption = '&'#1055#1086#1084#1086#1097#1100
      Hint = #1055#1086#1084#1086#1097#1100' '#1087#1086' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      OnClick = N2Click
      OnAdvancedDrawItem = N2AdvancedDrawItem
    end
    object N1: TMenuItem
      Tag = 1
      Caption = '&'#1052#1085#1077#1084#1086#1089#1093#1077#1084#1099
      OnAdvancedDrawItem = N2AdvancedDrawItem
      object N3: TMenuItem
        Caption = #1044#1086#1079#1080#1088#1086#1074#1082#1072' 1'
        Hint = #1052#1085#1077#1084#1086#1089#1093#1077#1084#1072' '#1091#1095#1072#1089#1090#1082#1072' '#1076#1086#1079#1080#1088#1086#1074#1082#1080' N1'
        OnClick = N3Click
        OnAdvancedDrawItem = N2AdvancedDrawItem
      end
      object N23: TMenuItem
        Caption = #1044#1086#1079#1080#1088#1086#1074#1082#1072' 2'
        Hint = #1052#1085#1077#1084#1086#1089#1093#1077#1084#1072' '#1091#1095#1072#1089#1090#1082#1072' '#1076#1086#1079#1080#1088#1086#1074#1082#1080' N2'
        OnClick = N33Click
        OnAdvancedDrawItem = N2AdvancedDrawItem
      end
      object N4: TMenuItem
        Caption = #1040#1074#1090#1086#1082#1083#1072#1074#1099
        Hint = #1052#1085#1077#1084#1086#1089#1093#1077#1084#1072' '#1040#1074#1090#1086#1082#1083#1072#1074#1086#1074
        OnClick = N4Click
        OnAdvancedDrawItem = N2AdvancedDrawItem
      end
    end
    object N5: TMenuItem
      Tag = 5
      Caption = '&'#1043#1088#1072#1092#1080#1082#1080
      OnAdvancedDrawItem = N2AdvancedDrawItem
      object N11: TMenuItem
        Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1099' '#1091#1095#1072#1089#1090#1082#1072' '#1076#1086#1079#1080#1088#1086#1074#1082#1080' 1'
        Hint = #1043#1088#1072#1092#1080#1082#1080' '#1090#1077#1084#1087#1077#1088#1072#1090#1091#1088' '#1091#1095#1072#1089#1090#1082#1072' '#1076#1086#1079#1080#1088#1086#1074#1082#1080' N1'
        OnClick = N11Click
        OnAdvancedDrawItem = N2AdvancedDrawItem
      end
      object N24: TMenuItem
        Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1099' '#1091#1095#1072#1089#1090#1082#1072' '#1076#1086#1079#1080#1088#1086#1074#1082#1080' 2'
        Hint = #1043#1088#1072#1092#1080#1082#1080' '#1090#1077#1084#1087#1077#1088#1072#1090#1091#1088' '#1091#1095#1072#1089#1090#1082#1072' '#1076#1086#1079#1080#1088#1086#1074#1082#1080' N2'
        OnClick = N111Click
        OnAdvancedDrawItem = N2AdvancedDrawItem
      end
      object N21: TMenuItem
        Caption = #1044#1086#1079#1072#1090#1086#1088#1099' '#1089#1091#1093#1086#1075#1086', '#1084#1086#1082#1088#1086#1075#1086
        Hint = #1043#1088#1072#1092#1080#1082#1080' '#1079#1072#1075#1088#1091#1079#1082#1080' '#1080' '#1074#1099#1075#1088#1091#1079#1082#1080' '#1076#1086#1079#1072#1090#1086#1088#1086#1074' '#1089#1091#1093#1086#1075#1086' '#1080' '#1084#1086#1082#1088#1086#1075#1086
        OnClick = N21Click
        OnAdvancedDrawItem = N2AdvancedDrawItem
      end
      object N10: TMenuItem
        Caption = #1044#1086#1079#1072#1090#1086#1088#1099' '#1087#1072#1089#1090#1099
        Hint = #1043#1088#1072#1092#1080#1082#1080' '#1079#1072#1075#1088#1091#1079#1082#1080' '#1080' '#1074#1099#1075#1088#1091#1079#1082#1080' '#1076#1086#1079#1072#1090#1086#1088#1086#1074' '#1087#1091#1076#1088#1099' '#1080' '#1087#1072#1089#1090#1099
        OnClick = SpeedButton9Click
        OnAdvancedDrawItem = N2AdvancedDrawItem
      end
      object N31: TMenuItem
        Caption = #1040#1074#1090#1086#1082#1083#1072#1074' '#8470'1'
        Hint = #1043#1088#1072#1092#1080#1082#1080' '#1088#1072#1073#1086#1090#1099' '#1040#1074#1090#1086#1082#1083#1072#1074#1072' 1'
        OnClick = N31Click
        OnAdvancedDrawItem = N2AdvancedDrawItem
      end
      object N41: TMenuItem
        Caption = #1040#1074#1090#1086#1082#1083#1072#1074' '#8470'2'
        Hint = #1043#1088#1072#1092#1080#1082#1080' '#1088#1072#1073#1086#1090#1099' '#1040#1074#1090#1086#1082#1083#1072#1074#1072' 2'
        OnClick = N41Click
        OnAdvancedDrawItem = N2AdvancedDrawItem
      end
      object N51: TMenuItem
        Caption = #1040#1074#1090#1086#1082#1083#1072#1074' '#8470'3'
        Hint = #1043#1088#1072#1092#1080#1082#1080' '#1088#1072#1073#1086#1090#1099' '#1040#1074#1090#1086#1082#1083#1072#1074#1072' 3'
        OnClick = N51Click
        OnAdvancedDrawItem = N2AdvancedDrawItem
      end
      object N42: TMenuItem
        Caption = #1040#1074#1090#1086#1082#1083#1072#1074' '#8470'4'
        Hint = #1043#1088#1072#1092#1080#1082#1080' '#1088#1072#1073#1086#1090#1099' '#1040#1074#1090#1086#1082#1083#1072#1074#1072' 4'
        OnClick = N45Click
        OnAdvancedDrawItem = N2AdvancedDrawItem
      end
      object N52: TMenuItem
        Caption = #1040#1074#1090#1086#1082#1083#1072#1074' '#8470'5'
        Hint = #1043#1088#1072#1092#1080#1082#1080' '#1088#1072#1073#1086#1090#1099' '#1072#1074#1090#1086#1082#1083#1072#1074#1072' 5'
        OnClick = N46Click
        OnAdvancedDrawItem = N2AdvancedDrawItem
      end
      object N61: TMenuItem
        Caption = #1040#1074#1090#1086#1082#1083#1072#1074' '#8470'6'
        Hint = #1043#1088#1072#1092#1080#1082#1080' '#1088#1072#1073#1086#1090#1099' '#1040#1074#1090#1086#1082#1083#1072#1074#1072' 6'
        OnClick = N47Click
        OnAdvancedDrawItem = N2AdvancedDrawItem
      end
    end
    object N6: TMenuItem
      Tag = 6
      Caption = '&'#1055#1088#1086#1089#1084#1086#1090#1088' '#1041#1044
      OnAdvancedDrawItem = N2AdvancedDrawItem
      object N13: TMenuItem
        Caption = #1044#1086#1079#1072#1090#1086#1088' '#1089#1091#1093#1086#1075#1086
        Hint = #1047#1072#1075#1088#1091#1079#1082#1072' '#1080' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1077' '#1090#1072#1073#1083#1080#1094' '#1076#1072#1085#1085#1099#1093' '#1044#1086#1079#1072#1090#1088#1072' '#1089#1091#1093#1086#1075#1086
        OnClick = N13Click
        OnAdvancedDrawItem = N2AdvancedDrawItem
      end
      object N14: TMenuItem
        Caption = #1044#1086#1079#1072#1090#1086#1088' '#1084#1086#1082#1088#1086#1075#1086
        Hint = #1047#1072#1075#1088#1091#1079#1082#1072' '#1080' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1077' '#1090#1072#1073#1083#1080#1094' '#1076#1072#1085#1085#1099#1093' '#1044#1086#1079#1072#1090#1088#1072' '#1084#1086#1082#1088#1086#1075#1086
        OnClick = N14Click
        OnAdvancedDrawItem = N2AdvancedDrawItem
      end
      object N15: TMenuItem
        Caption = #1044#1086#1079#1072#1090#1086#1088' '#1087#1072#1089#1090#1099
        Hint = #1047#1072#1075#1088#1091#1079#1082#1072' '#1080' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1077' '#1090#1072#1073#1083#1080#1094' '#1076#1072#1085#1085#1099#1093' '#1044#1086#1079#1072#1090#1088#1072' '#1087#1091#1076#1088#1099' '#1080' '#1087#1072#1089#1090#1099
        OnClick = N15Click
        OnAdvancedDrawItem = N2AdvancedDrawItem
      end
      object N16: TMenuItem
        Caption = #1040#1074#1090#1086#1082#1083#1072#1074'1'
        Hint = #1047#1072#1075#1088#1091#1079#1082#1072' '#1080' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1077' '#1090#1072#1073#1083#1080#1094' '#1076#1072#1085#1085#1099#1093'  '#1040#1074#1090#1086#1082#1083#1072#1074#1072' 1'
        OnClick = N16Click
        OnAdvancedDrawItem = N2AdvancedDrawItem
      end
      object N22: TMenuItem
        Caption = #1040#1074#1090#1086#1082#1083#1072#1074'2'
        Hint = #1047#1072#1075#1088#1091#1079#1082#1072' '#1080' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1077' '#1090#1072#1073#1083#1080#1094' '#1076#1072#1085#1085#1099#1093'  '#1040#1074#1090#1086#1082#1083#1072#1074#1072' 2'
        OnClick = N22Click
        OnAdvancedDrawItem = N2AdvancedDrawItem
      end
      object N32: TMenuItem
        Caption = #1040#1074#1090#1086#1082#1083#1072#1074'3'
        Hint = #1047#1072#1075#1088#1091#1079#1082#1072' '#1080' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1077' '#1090#1072#1073#1083#1080#1094' '#1076#1072#1085#1085#1099#1093'  '#1040#1074#1090#1086#1082#1083#1072#1074#1072' 3'
        OnClick = N32Click
        OnAdvancedDrawItem = N2AdvancedDrawItem
      end
      object N43: TMenuItem
        Caption = #1040#1074#1090#1086#1082#1083#1072#1074'4'
        Hint = #1047#1072#1075#1088#1091#1079#1082#1072' '#1080' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1077' '#1090#1072#1073#1083#1080#1094' '#1076#1072#1085#1085#1099#1093'  '#1040#1074#1090#1086#1082#1083#1072#1074#1072' 4'
        OnClick = N43Click
        OnAdvancedDrawItem = N2AdvancedDrawItem
      end
      object N55: TMenuItem
        Caption = #1040#1074#1090#1086#1082#1083#1072#1074'5'
        Hint = #1047#1072#1075#1088#1091#1079#1082#1072' '#1080' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1077' '#1090#1072#1073#1083#1080#1094' '#1076#1072#1085#1085#1099#1093'  '#1040#1074#1090#1086#1082#1083#1072#1074#1072' 5'
        OnClick = N55Click
        OnAdvancedDrawItem = N2AdvancedDrawItem
      end
      object N56: TMenuItem
        Caption = #1040#1074#1090#1086#1082#1083#1072#1074'6'
        Hint = #1047#1072#1075#1088#1091#1079#1082#1072' '#1080' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1077' '#1090#1072#1073#1083#1080#1094' '#1076#1072#1085#1085#1099#1093'  '#1040#1074#1090#1086#1082#1083#1072#1074#1072' 6'
        OnClick = N56Click
        OnAdvancedDrawItem = N2AdvancedDrawItem
      end
    end
    object N7: TMenuItem
      Tag = 7
      Caption = #1054#1090#1095#1077#1090#1099
      OnAdvancedDrawItem = N2AdvancedDrawItem
      object N8: TMenuItem
        Tag = 1
        Caption = #1056#1072#1089#1093#1086#1076' '#1082#1086#1084#1087#1086#1085#1077#1085#1090#1086#1074' '#1076#1086#1079#1080#1088#1086#1074#1082#1080
        Hint = 
          #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1080' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1077' '#1086#1090#1095#1077#1090#1072' '#1087#1086' '#1088#1072#1089#1093#1086#1076#1091' '#1082#1086#1084#1087#1086#1085#1077#1085#1090#1086#1074' '#1076#1086#1079#1080#1088#1086#1074 +
          #1082#1080
        OnClick = N8Click
        OnAdvancedDrawItem = N2AdvancedDrawItem
      end
      object N9: TMenuItem
        Tag = 9
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1089#1086#1093#1088#1072#1085#1077#1085#1085#1099#1093' '#1086#1090#1095#1077#1090#1086#1074
        Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1088#1072#1085#1077#1077' '#1089#1086#1093#1088#1072#1085#1077#1085#1085#1099#1093' '#1086#1090#1095#1077#1090#1086#1074
        OnClick = N9Click
        OnAdvancedDrawItem = N2AdvancedDrawItem
      end
    end
    object F101: TMenuItem
      Tag = 101
      Caption = '&'#1042#1099#1093#1086#1076
      Hint = #1042#1099#1093#1086#1076' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      OnClick = F101Click
      OnAdvancedDrawItem = N2AdvancedDrawItem
    end
  end
  object TcpClient1: TTcpClient
    OnCreateHandle = TcpClient1CreateHandle
    OnDestroyHandle = TcpClient1DestroyHandle
    OnConnect = TcpClient1Connect
    OnDisconnect = TcpClient1Disconnect
    OnReceive = TcpClient1Receive
    OnSend = TcpClient1Send
    OnError = TcpClient1Error
    Left = 11
    Top = 86
  end
  object TcpServer1: TTcpServer
    BlockMode = bmBlocking
    Left = 11
    Top = 118
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 12
    Top = 163
  end
  object Timer2: TTimer
    Interval = 2000
    OnTimer = Timer2Timer
    Left = 13
    Top = 195
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    ModalPreview = False
    ModifyPrepared = False
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = #1055#1088#1086#1089#1084#1086#1090#1088' '#1086#1090#1095#1077#1090#1086#1074
    RebuildPrinter = False
    Left = 14
    Top = 240
    ReportForm = {19000000}
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.frp'
    Left = 14
    Top = 272
  end
end

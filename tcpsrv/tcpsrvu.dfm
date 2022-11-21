object Form1: TForm1
  Left = 264
  Top = 146
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'TCP Server'
  ClientHeight = 409
  ClientWidth = 570
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 4
    Top = 162
    Width = 98
    Height = 17
    AutoSize = False
    Caption = #1052#1086#1085#1080#1090#1086#1088' '#1079#1085#1072#1095#1077#1085#1080#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Shape2: TShape
    Left = 537
    Top = 24
    Width = 21
    Height = 21
    Brush.Color = clSilver
    Shape = stCircle
  end
  object Label1: TLabel
    Left = 4
    Top = 7
    Width = 98
    Height = 17
    AutoSize = False
    Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 113
    Top = 162
    Width = 167
    Height = 13
    Caption = '['#1054#1073#1083#1072#1089#1090#1100' '#1087#1072#1084#1103#1090#1080' '#1085#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1072']'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object StringGrid1: TStringGrid
    Left = 5
    Top = 179
    Width = 559
    Height = 192
    ColCount = 4
    Ctl3D = True
    DefaultColWidth = 150
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
    ParentCtl3D = False
    TabOrder = 0
    OnClick = StringGrid1Click
    ColWidths = (
      33
      120
      77
      305)
  end
  object StringGrid2: TStringGrid
    Left = 5
    Top = 24
    Width = 490
    Height = 129
    BiDiMode = bdLeftToRight
    ColCount = 4
    Ctl3D = True
    DefaultColWidth = 150
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 6
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
    ParentBiDiMode = False
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    ColWidths = (
      33
      120
      180
      150)
  end
  object StaticText1: TStaticText
    Left = 4
    Top = 381
    Width = 561
    Height = 21
    AutoSize = False
    BorderStyle = sbsSingle
    TabOrder = 2
  end
  object CheckBox1: TCheckBox
    Left = 500
    Top = 46
    Width = 15
    Height = 17
    TabOrder = 3
  end
  object CheckBox2: TCheckBox
    Left = 500
    Top = 69
    Width = 15
    Height = 17
    TabOrder = 4
  end
  object CheckBox3: TCheckBox
    Left = 500
    Top = 90
    Width = 15
    Height = 17
    TabOrder = 5
  end
  object CheckBox4: TCheckBox
    Left = 500
    Top = 111
    Width = 15
    Height = 17
    TabOrder = 6
  end
  object CheckBox5: TCheckBox
    Left = 500
    Top = 132
    Width = 15
    Height = 17
    TabOrder = 7
  end
  object Button1: TButton
    Left = 537
    Top = 130
    Width = 23
    Height = 23
    Hint = #1059#1076#1072#1083#1077#1085#1080#1077' '#1086#1090#1084#1077#1095#1077#1085#1085#1099#1093' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1081
    Caption = 'X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = Button1Click
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 18
    Top = 330
  end
  object Timer2: TTimer
    Interval = 200
    OnTimer = Timer2Timer
    Left = 59
    Top = 331
  end
end

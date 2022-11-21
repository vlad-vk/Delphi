object Form01: TForm01
  Left = 277
  Top = 164
  AutoScroll = False
  BorderIcons = [biSystemMenu]
  Caption = 'Disomat'
  ClientHeight = 134
  ClientWidth = 482
  Color = clActiveBorder
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button01: TButton
    Left = 384
    Top = 3
    Width = 96
    Height = 19
    Caption = #1048#1085#1080#1094#1080#1072#1083#1080#1079#1072#1094#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = InitCOMPortF
  end
  object Button02: TButton
    Left = 384
    Top = 25
    Width = 96
    Height = 19
    Caption = #1042#1099#1093#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button02Click
  end
  object STAT: TStaticText
    Left = 2
    Top = 91
    Width = 479
    Height = 18
    AutoSize = False
    BevelEdges = []
    BorderStyle = sbsSingle
    Color = clMoneyGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
  end
  object TEXT: TStaticText
    Left = 2
    Top = 3
    Width = 375
    Height = 40
    AutoSize = False
    BevelEdges = []
    BorderStyle = sbsSunken
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 3
  end
  object SND: TStaticText
    Left = 2
    Top = 48
    Width = 479
    Height = 18
    AutoSize = False
    BevelEdges = []
    BorderStyle = sbsSingle
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Terminal'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 4
  end
  object RCV: TStaticText
    Left = 2
    Top = 67
    Width = 479
    Height = 18
    AutoSize = False
    BevelEdges = []
    BorderStyle = sbsSingle
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Terminal'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 5
  end
  object INIT: TStaticText
    Left = 2
    Top = 118
    Width = 479
    Height = 15
    AutoSize = False
    BevelEdges = []
    BorderStyle = sbsSunken
    Color = clActiveBorder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -7
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 6
  end
  object CPDrv01: TCommPortDriver
    Port = pnCustom
    PortName = '\\.\COM1'
    EnableDTROnOpen = False
    OnReceiveData = CPDrv01ReceiveData
    Left = 344
    Top = 8
  end
  object Timer02: TTimer
    Enabled = False
    Interval = 5
    OnTimer = Timer02Timer
    Left = 313
    Top = 8
  end
  object Timer01: TTimer
    Interval = 10000
    OnTimer = Timer01Timer
    Left = 280
    Top = 8
  end
end

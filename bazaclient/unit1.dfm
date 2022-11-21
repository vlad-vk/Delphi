object fmMnemo: TfmMnemo
  Left = 130
  Top = 154
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderIcons = []
  BorderStyle = bsNone
  Caption = #1043#1088#1072#1092#1080#1082#1080
  ClientHeight = 715
  ClientWidth = 1014
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object book: TNotebook
    Left = 0
    Top = 0
    Width = 1014
    Height = 662
    Align = alClient
    PageIndex = 2
    TabOrder = 0
    object TPage
      Left = 0
      Top = 0
      Caption = 'Default'
      object Panel02: TPanel
        Left = 0
        Top = 0
        Width = 1014
        Height = 662
        Align = alClient
        TabOrder = 0
        object DBChart1: TDBChart
          Left = 1
          Top = 1
          Width = 1012
          Height = 660
          OnProcessRecord = DBChartProcessRecord
          AllowPanning = pmNone
          AllowZoom = False
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Foot.Text.Strings = (
            ' ')
          MarginBottom = 10
          MarginLeft = 5
          MarginRight = 5
          MarginTop = 5
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -12
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Title.Text.Strings = (
            #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1099' '#1091#1095#1072#1089#1090#1082#1072' '#1076#1086#1079#1080#1088#1086#1074#1086#1082' N1')
          OnClickBackground = DBChartClickBackground
          BottomAxis.DateTimeFormat = 'h:mm'
          BottomAxis.Increment = 0.000694444444444444
          BottomAxis.Inverted = True
          LeftAxis.Automatic = False
          LeftAxis.AutomaticMaximum = False
          LeftAxis.AutomaticMinimum = False
          LeftAxis.ExactDateTime = False
          LeftAxis.Increment = 5.000000000000000000
          LeftAxis.LabelStyle = talValue
          LeftAxis.Maximum = 100.000000000000000000
          LeftAxis.Title.Angle = 0
          Legend.Alignment = laBottom
          Legend.DividingLines.Visible = True
          Legend.LegendStyle = lsSeries
          Legend.ResizeChart = False
          Legend.ShadowSize = 0
          Legend.TopPos = 0
          Legend.Visible = False
          MaxPointsPerPage = 900
          RightAxis.Title.Angle = 0
          ScaleLastPage = False
          View3D = False
          View3DOptions.ZoomText = False
          OnAfterDraw = DBChartAfterDraw
          Align = alClient
          TabOrder = 0
          DesignSize = (
            1012
            660)
          object STTD1: TStaticText
            Left = 16
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clMoneyGreen
            ParentColor = False
            TabOrder = 0
          end
          object STTD4: TStaticText
            Left = 317
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 1
          end
          object STTD5: TStaticText
            Left = 412
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 33023
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 2
          end
          object STTDD: TStaticText
            Left = 16
            Top = 598
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clMoneyGreen
            ParentColor = False
            TabOrder = 3
          end
          object StaticText28: TStaticText
            Left = 300
            Top = 598
            Width = 75
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058' '#1096#1083#1072#1084#1072
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 4
          end
          object StaticText29: TStaticText
            Left = 395
            Top = 598
            Width = 75
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058' '#1086#1073#1088' '#1096#1083#1072#1084#1072
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 28927
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 5
          end
          object CBTD4: TCheckBox
            Left = 300
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 6
            OnClick = ClickChecked
          end
          object CBTD5: TCheckBox
            Left = 395
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 7
            OnClick = ClickChecked
          end
          object STTD2: TStaticText
            Left = 127
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clPurple
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 8
          end
          object STTD3: TStaticText
            Left = 222
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 9
          end
          object StaticText33: TStaticText
            Left = 110
            Top = 598
            Width = 75
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058' '#1075#1086#1088' '#1074#1086#1076#1099
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clPurple
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 10
          end
          object StaticText34: TStaticText
            Left = 205
            Top = 598
            Width = 75
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058' '#1093#1086#1083' '#1074#1086#1076#1099
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 11
          end
          object CBTD2: TCheckBox
            Left = 110
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 12
            OnClick = ClickChecked
          end
          object CBTD3: TCheckBox
            Left = 205
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 13
            OnClick = ClickChecked
          end
          object STTD7: TStaticText
            Left = 602
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 14
          end
          object STTD6: TStaticText
            Left = 507
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clOlive
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 15
          end
          object StaticText36: TStaticText
            Left = 585
            Top = 598
            Width = 75
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058' '#1072#1083' '#1089#1091#1089#1087' '#1084'2'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 16
          end
          object StaticText35: TStaticText
            Left = 490
            Top = 598
            Width = 75
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058' '#1072#1083' '#1089#1091#1089#1087' '#1084'1'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clOlive
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 17
          end
          object CBTD7: TCheckBox
            Left = 585
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 18
            OnClick = ClickChecked
          end
          object CBTD6: TCheckBox
            Left = 490
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 19
            OnClick = ClickChecked
          end
          object CBTD8: TCheckBox
            Left = 680
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 20
            OnClick = ClickChecked
          end
          object CBTD9: TCheckBox
            Left = 775
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 21
            OnClick = ClickChecked
          end
          object STTD9: TStaticText
            Left = 792
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 22
          end
          object STTD8: TStaticText
            Left = 697
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 23
          end
          object StaticText38: TStaticText
            Left = 680
            Top = 598
            Width = 75
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058' '#1094#1077#1084#1077#1085#1090#1072
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 24
          end
          object StaticText37: TStaticText
            Left = 775
            Top = 598
            Width = 75
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058' '#1074#1103#1078#1091#1097#1080#1093
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 25
          end
          object StaticText32: TStaticText
            Left = 870
            Top = 598
            Width = 75
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058' '#1042#1043#1041#1052
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 26
          end
          object STTD10: TStaticText
            Left = 887
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 27
          end
          object CBTD10: TCheckBox
            Left = 870
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 28
            OnClick = ClickChecked
          end
          object Series11: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_tds
            SeriesColor = clPurple
            Title = #1058' '#1075#1086#1088' '#1074#1086#1076#1099
            LinePen.Color = clPurple
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'AIT101A__V'
          end
          object Series12: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_tds
            SeriesColor = 10485760
            Title = #1058' '#1093#1086#1083' '#1074#1086#1076#1099
            LinePen.Color = 10485760
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'AIT102A__V'
          end
          object Series1: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_tds
            SeriesColor = clRed
            Title = #1058' '#1096#1083#1072#1084#1072
            LinePen.Color = clRed
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'AIT103A__V'
          end
          object Series2: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_tds
            SeriesColor = 33023
            Title = #1058' '#1086#1073#1088' '#1096#1083#1072#1084#1072
            LinePen.Color = 33023
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'AIT104A__V'
          end
          object Series13: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_tds
            SeriesColor = clOlive
            Title = #1058' '#1072#1083' '#1089#1091#1089#1087' '#1084'1'
            LinePen.Color = clOlive
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'AIT107A__V'
          end
          object Series14: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_tds
            SeriesColor = clGray
            Title = #1058' '#1072#1083' '#1089#1091#1089#1087' '#1084'2'
            LinePen.Color = clGray
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'AIT108A__V'
          end
          object Series15: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_tds
            SeriesColor = 8421440
            Title = #1058' '#1094#1077#1084#1077#1085#1090#1072
            LinePen.Color = 8421440
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'AIT105A__V'
          end
          object Series16: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_tds
            SeriesColor = clGreen
            Title = #1058' '#1074#1103#1078#1091#1097#1080#1093
            LinePen.Color = clGreen
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'AIT106A__V'
          end
          object Series17: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_tds
            SeriesColor = clBlack
            Title = #1058' '#1042#1043#1041#1052
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'AIT110A__V'
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 1
      Caption = '2'
      object Panel03: TPanel
        Left = 0
        Top = 0
        Width = 1014
        Height = 662
        Align = alClient
        TabOrder = 0
        object dozat_arx: TDBChart
          Left = 1
          Top = 1
          Width = 1012
          Height = 660
          OnProcessRecord = DBChartProcessRecord
          AllowPanning = pmNone
          AllowZoom = False
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Foot.Text.Strings = (
            ' ')
          MarginBottom = 10
          MarginLeft = 5
          MarginRight = 5
          MarginTop = 5
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -13
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Title.Text.Strings = (
            #1044#1086#1079#1072#1090#1086#1088#1099' '#1089#1091#1093#1086#1075#1086', '#1084#1086#1082#1088#1086#1075#1086)
          OnClickBackground = DBChartClickBackground
          BottomAxis.DateTimeFormat = 'hh:mm:ss'
          BottomAxis.Increment = 0.000694444444444444
          BottomAxis.Inverted = True
          BottomAxis.LabelsSize = 14
          BottomAxis.LabelStyle = talValue
          BottomAxis.RoundFirstLabel = False
          BottomAxis.TickLength = 0
          BottomAxis.TickOnLabelsOnly = False
          LeftAxis.Automatic = False
          LeftAxis.AutomaticMaximum = False
          LeftAxis.AutomaticMinimum = False
          LeftAxis.ExactDateTime = False
          LeftAxis.Increment = 5.000000000000000000
          LeftAxis.LabelsSize = 30
          LeftAxis.LabelStyle = talValue
          LeftAxis.Maximum = 3000.000000000000000000
          LeftAxis.MinorTicks.Color = clBlack
          LeftAxis.RoundFirstLabel = False
          LeftAxis.Ticks.Color = clBlack
          LeftAxis.Title.Angle = 0
          Legend.Alignment = laBottom
          Legend.DividingLines.Visible = True
          Legend.LegendStyle = lsSeries
          Legend.ResizeChart = False
          Legend.ShadowSize = 0
          Legend.TopPos = 0
          Legend.Visible = False
          MaxPointsPerPage = 900
          RightAxis.Title.Angle = 0
          ScaleLastPage = False
          View3D = False
          OnAfterDraw = DBChartAfterDraw
          Align = alClient
          TabOrder = 0
          DesignSize = (
            1012
            660)
          object STSM2: TStaticText
            Left = 261
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
          end
          object STSM3: TStaticText
            Left = 449
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 1
            Transparent = False
          end
          object STSM1: TStaticText
            Left = 16
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clMoneyGreen
            ParentColor = False
            TabOrder = 2
          end
          object STSMD: TStaticText
            Left = 16
            Top = 598
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clMoneyGreen
            ParentColor = False
            TabOrder = 3
          end
          object CBSM2: TCheckBox
            Left = 244
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 4
            OnClick = ClickChecked
          end
          object StaticText27: TStaticText
            Left = 221
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1042#1077#1089' '#1076#1086#1079#1072#1090#1086#1088#1072' '#1084#1086#1082#1088#1086#1075#1086' '#1044'1'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 5
          end
          object StaticText30: TStaticText
            Left = 409
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1042#1077#1089' '#1076#1086#1079#1072#1090#1086#1088#1072' '#1089#1091#1093#1086#1075#1086' '#1044'1'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 6
          end
          object CBSM3: TCheckBox
            Left = 432
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 7
            OnClick = ClickChecked
          end
          object STM32: TStaticText
            Left = 855
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 8
            Transparent = False
          end
          object STM22: TStaticText
            Left = 667
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 9
          end
          object StaticText50: TStaticText
            Left = 815
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1042#1077#1089' '#1076#1086#1079#1072#1090#1086#1088#1072' '#1089#1091#1093#1086#1075#1086' '#1044'2'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 10
          end
          object StaticText47: TStaticText
            Left = 627
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1042#1077#1089' '#1076#1086#1079#1072#1090#1086#1088#1072' '#1084#1086#1082#1088#1086#1075#1086' '#1044'2'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 11
          end
          object CBSM32: TCheckBox
            Left = 838
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 12
            OnClick = ClickChecked
          end
          object CBSM22: TCheckBox
            Left = 650
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 13
            OnClick = ClickChecked
          end
          object Series5: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_dsdm
            SeriesColor = 4227072
            Title = #1042#1077#1089' '#1076#1086#1079#1072#1090#1086#1088#1072' '#1084#1086#1082#1088#1086#1075#1086' '#1044'1'
            LinePen.Color = 4227072
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'AIW61'
          end
          object Series6: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_dsdm
            SeriesColor = clBlue
            Title = #1042#1077#1089' '#1076#1086#1079#1072#1090#1086#1088#1072' '#1089#1091#1093#1086#1075#1086' '#1044'1'
            LinePen.Color = clBlue
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'AIW62'
          end
          object Series3: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_dsdm
            SeriesColor = clBlack
            Title = #1042#1077#1089' '#1076#1086#1079#1072#1090#1086#1088#1072' '#1084#1086#1082#1088#1086#1075#1086' '#1044'2'
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'AIW252___V'
          end
          object Series18: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_dsdm
            SeriesColor = clMaroon
            Title = #1042#1077#1089' '#1076#1086#1079#1072#1090#1086#1088#1072' '#1089#1091#1093#1086#1075#1086' '#1044'2'
            LinePen.Color = clMaroon
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'AIW218___V'
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 2
      Caption = 'pudra,pasta'
      object Panel04: TPanel
        Left = 0
        Top = 0
        Width = 1014
        Height = 662
        Align = alClient
        TabOrder = 0
        object DBChart2: TDBChart
          Left = 1
          Top = 1
          Width = 1012
          Height = 660
          OnProcessRecord = DBChartProcessRecord
          AllowPanning = pmNone
          AllowZoom = False
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Foot.Text.Strings = (
            ' ')
          MarginBottom = 10
          MarginLeft = 5
          MarginRight = 5
          MarginTop = 5
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -13
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Title.Text.Strings = (
            #1042#1077#1089' '#1076#1086#1079#1072#1090#1086#1088#1086#1074' '#1087#1072#1089#1090#1099)
          OnClickBackground = DBChartClickBackground
          BottomAxis.DateTimeFormat = 'hh:mm:ss'
          BottomAxis.Increment = 0.000694444444444444
          BottomAxis.Inverted = True
          LeftAxis.Automatic = False
          LeftAxis.AutomaticMaximum = False
          LeftAxis.AutomaticMinimum = False
          LeftAxis.ExactDateTime = False
          LeftAxis.Increment = 5.000000000000000000
          LeftAxis.Maximum = 60.000000000000000000
          LeftAxis.Title.Angle = 0
          Legend.Alignment = laBottom
          Legend.DividingLines.Visible = True
          Legend.LegendStyle = lsSeries
          Legend.ResizeChart = False
          Legend.ShadowSize = 0
          Legend.TextStyle = ltsXValue
          Legend.TopPos = 0
          Legend.Visible = False
          MaxPointsPerPage = 900
          RightAxis.Title.Angle = 0
          ScaleLastPage = False
          View3D = False
          View3DOptions.ZoomText = False
          OnAfterDraw = DBChartAfterDraw
          Align = alClient
          TabOrder = 0
          DesignSize = (
            1012
            660)
          object STPP1: TStaticText
            Left = 16
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clMoneyGreen
            ParentColor = False
            TabOrder = 0
          end
          object STPP3: TStaticText
            Left = 395
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 1
          end
          object STPPD: TStaticText
            Left = 16
            Top = 598
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clMoneyGreen
            ParentColor = False
            TabOrder = 2
          end
          object StaticText26: TStaticText
            Left = 355
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1042#1077#1089' '#1076#1086#1079#1072#1090#1086#1088#1072' '#1087#1072#1089#1090#1099' '#1044'1'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 3
          end
          object CBPP3: TCheckBox
            Left = 378
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 4
            OnClick = ClickChecked
          end
          object STPP4: TStaticText
            Left = 583
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 5
          end
          object StaticText31: TStaticText
            Left = 543
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1042#1077#1089' '#1076#1086#1079#1072#1090#1086#1088#1072' '#1087#1072#1089#1090#1099' '#1044'2'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 6
          end
          object CBPP4: TCheckBox
            Left = 566
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 7
            OnClick = ClickChecked
          end
          object Series4: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_pp
            SeriesColor = clBlue
            Title = #1042#1077#1089' '#1076#1086#1079#1072#1090#1086#1088#1072' '#1087#1072#1089#1090#1099' '#1044'1'
            LinePen.Color = clBlue
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'AIW65'
          end
          object Series19: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_pp
            SeriesColor = clMaroon
            Title = #1042#1077#1089' '#1076#1086#1079#1072#1090#1086#1088#1072' '#1087#1072#1089#1090#1099' '#1044'2'
            LinePen.Color = clMaroon
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'AIW216___V'
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 3
      Caption = 'autoklav1'
      object Panel05: TPanel
        Left = 0
        Top = 0
        Width = 1014
        Height = 662
        Align = alClient
        Caption = 'Panel05'
        TabOrder = 0
        object autoklav1: TDBChart
          Left = 1
          Top = 1
          Width = 1012
          Height = 660
          OnProcessRecord = DBChartProcessRecord
          AllowPanning = pmNone
          AllowZoom = False
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Foot.Text.Strings = (
            ' ')
          MarginBottom = 10
          MarginLeft = 5
          MarginRight = 5
          MarginTop = 5
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -12
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Title.Text.Strings = (
            #1040#1074#1090#1086#1082#1083#1072#1074' '#8470'1')
          OnClickBackground = DBChartClickBackground
          BottomAxis.DateTimeFormat = 'h:mm'
          BottomAxis.Increment = 0.000694444444444444
          BottomAxis.Inverted = True
          BottomAxis.RoundFirstLabel = False
          LeftAxis.Automatic = False
          LeftAxis.AutomaticMaximum = False
          LeftAxis.AutomaticMinimum = False
          LeftAxis.ExactDateTime = False
          LeftAxis.Increment = 10.000000000000000000
          LeftAxis.Maximum = 200.000000000000000000
          LeftAxis.Title.Angle = 0
          Legend.Alignment = laBottom
          Legend.DividingLines.Visible = True
          Legend.LegendStyle = lsSeries
          Legend.ShadowSize = 0
          Legend.TopPos = 0
          Legend.Visible = False
          MaxPointsPerPage = 900
          RightAxis.Title.Angle = 0
          ScaleLastPage = False
          View3D = False
          View3DOptions.ZoomText = False
          OnAfterDraw = DBChartAfterDraw
          Align = alClient
          TabOrder = 0
          DesignSize = (
            1012
            660)
          object STA10: TStaticText
            Left = 16
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clMoneyGreen
            ParentColor = False
            TabOrder = 0
          end
          object STA11: TStaticText
            Left = 156
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 1
          end
          object STA12: TStaticText
            Left = 292
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 33023
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 2
          end
          object STA13: TStaticText
            Left = 426
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clFuchsia
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 3
          end
          object STA14: TStaticText
            Left = 560
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 4
          end
          object STA15: TStaticText
            Left = 695
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clLime
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 5
          end
          object STA16: TStaticText
            Left = 832
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clOlive
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 6
          end
          object STA1D: TStaticText
            Left = 16
            Top = 598
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clMoneyGreen
            ParentColor = False
            TabOrder = 7
          end
          object StaticText1: TStaticText
            Left = 115
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1087#1072#1088#1072
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 8
            Transparent = False
          end
          object StaticText2: TStaticText
            Left = 250
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1074#1077#1088#1093#1085#1103#1103
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 41215
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 9
          end
          object StaticText3: TStaticText
            Left = 385
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1085#1080#1078#1085#1103#1103
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clFuchsia
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 10
          end
          object StaticText4: TStaticText
            Left = 519
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1044#1072#1074#1083#1077#1085#1080#1077
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 11
          end
          object StaticText5: TStaticText
            Left = 653
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1056#1072#1089#1093#1086#1076' '#1087#1072#1088#1072
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 12
          end
          object StaticText6: TStaticText
            Left = 788
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1059#1088#1086#1074#1077#1085#1100' '#1082#1086#1085#1076#1077#1085#1089#1072#1090#1072
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clOlive
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 13
          end
          object CBA11: TCheckBox
            Left = 140
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 14
            OnClick = ClickChecked
          end
          object CBA12: TCheckBox
            Left = 275
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 15
            OnClick = ClickChecked
          end
          object CBA13: TCheckBox
            Left = 409
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 16
            OnClick = ClickChecked
          end
          object CBA14: TCheckBox
            Left = 544
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 17
            OnClick = ClickChecked
          end
          object CBA15: TCheckBox
            Left = 678
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 18
            OnClick = ClickChecked
          end
          object CBA16: TCheckBox
            Left = 816
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 19
            OnClick = ClickChecked
          end
          object FastLineSeries1: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a1
            SeriesColor = clRed
            Title = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1087#1072#1088#1072
            LinePen.Color = clRed
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A1_T'
          end
          object FastLineSeries2: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a1
            SeriesColor = 33023
            Title = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1074#1077#1088#1093#1085#1103#1103
            LinePen.Color = 33023
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A1_T_TOP'
          end
          object Series7: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a1
            SeriesColor = clFuchsia
            Title = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1085#1080#1078#1085#1103#1103
            LinePen.Color = clFuchsia
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A1_T_BOTTOM'
          end
          object Series8: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a1
            SeriesColor = 16744448
            Title = #1044#1072#1074#1083#1077#1085#1080#1077
            LinePen.Color = 16744448
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A1_P_PAR'
          end
          object Series9: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a1
            SeriesColor = clLime
            Title = #1056#1072#1089#1093#1086#1076' '#1087#1072#1088#1072
            LinePen.Color = clLime
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A1_F_PAR'
          end
          object Series10: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a1
            SeriesColor = clOlive
            Title = #1059#1088#1086#1074#1077#1085#1100' '#1082#1086#1085#1076#1077#1085#1089#1072#1090#1072
            LinePen.Color = clOlive
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A1_H_COND'
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 4
      Caption = 'autoklav2'
      object Panel06: TPanel
        Left = 0
        Top = 0
        Width = 1014
        Height = 662
        Align = alClient
        Caption = 'Panel06'
        TabOrder = 0
        object autoklav2: TDBChart
          Left = 1
          Top = 1
          Width = 1012
          Height = 660
          OnProcessRecord = DBChartProcessRecord
          AllowPanning = pmNone
          AllowZoom = False
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Foot.Text.Strings = (
            ' ')
          MarginBottom = 10
          MarginLeft = 5
          MarginRight = 5
          MarginTop = 5
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -12
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Title.Text.Strings = (
            #1040#1074#1090#1086#1082#1083#1072#1074' '#8470'2')
          OnClickBackground = DBChartClickBackground
          BottomAxis.DateTimeFormat = 'h:mm'
          BottomAxis.Increment = 0.000694444444444444
          BottomAxis.Inverted = True
          BottomAxis.LabelsSeparation = 20
          BottomAxis.RoundFirstLabel = False
          LeftAxis.Automatic = False
          LeftAxis.AutomaticMaximum = False
          LeftAxis.AutomaticMinimum = False
          LeftAxis.ExactDateTime = False
          LeftAxis.Increment = 5.000000000000000000
          LeftAxis.Maximum = 200.000000000000000000
          LeftAxis.Title.Angle = 0
          Legend.Alignment = laBottom
          Legend.DividingLines.Visible = True
          Legend.LegendStyle = lsSeries
          Legend.ResizeChart = False
          Legend.ShadowSize = 0
          Legend.TopPos = 0
          Legend.Visible = False
          MaxPointsPerPage = 900
          RightAxis.Title.Angle = 0
          ScaleLastPage = False
          View3D = False
          OnAfterDraw = DBChartAfterDraw
          Align = alClient
          TabOrder = 0
          DesignSize = (
            1012
            660)
          object STA20: TStaticText
            Left = 16
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clMoneyGreen
            ParentColor = False
            TabOrder = 0
          end
          object STA21: TStaticText
            Left = 156
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 1
          end
          object STA22: TStaticText
            Left = 292
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 33023
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 2
          end
          object STA23: TStaticText
            Left = 426
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clFuchsia
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 3
          end
          object STA24: TStaticText
            Left = 560
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 4
          end
          object STA25: TStaticText
            Left = 695
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clLime
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 5
          end
          object STA26: TStaticText
            Left = 832
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clOlive
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 6
          end
          object STA2D: TStaticText
            Left = 16
            Top = 598
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clMoneyGreen
            ParentColor = False
            TabOrder = 7
          end
          object StaticText7: TStaticText
            Left = 115
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1087#1072#1088#1072
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 8
            Transparent = False
          end
          object StaticText8: TStaticText
            Left = 250
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1074#1077#1088#1093#1085#1103#1103
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 41215
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 9
          end
          object StaticText9: TStaticText
            Left = 385
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1085#1080#1078#1085#1103#1103
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clFuchsia
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 10
          end
          object StaticText10: TStaticText
            Left = 519
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1044#1072#1074#1083#1077#1085#1080#1077
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 11
          end
          object StaticText11: TStaticText
            Left = 653
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1056#1072#1089#1093#1086#1076' '#1087#1072#1088#1072
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 12
          end
          object StaticText12: TStaticText
            Left = 788
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1059#1088#1086#1074#1077#1085#1100' '#1082#1086#1085#1076#1077#1085#1089#1072#1090#1072
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clOlive
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 13
          end
          object CBA21: TCheckBox
            Left = 140
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 14
            OnClick = ClickChecked
          end
          object CBA22: TCheckBox
            Left = 275
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 15
            OnClick = ClickChecked
          end
          object CBA23: TCheckBox
            Left = 409
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 16
            OnClick = ClickChecked
          end
          object CBA24: TCheckBox
            Left = 544
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 17
            OnClick = ClickChecked
          end
          object CBA25: TCheckBox
            Left = 678
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 18
            OnClick = ClickChecked
          end
          object CBA26: TCheckBox
            Left = 816
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 19
            OnClick = ClickChecked
          end
          object FastLineSeries3: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a2
            SeriesColor = clRed
            Title = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1087#1072#1088#1072
            LinePen.Color = clRed
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A2_T'
          end
          object FastLineSeries4: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a2
            SeriesColor = 33023
            Title = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1074#1077#1088#1093#1085#1103#1103
            LinePen.Color = 33023
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A2_T_TOP'
          end
          object FastLineSeries9: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a2
            SeriesColor = clFuchsia
            Title = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1085#1080#1078#1085#1103#1103
            LinePen.Color = clFuchsia
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A2_T_BOTTOM'
          end
          object FastLineSeries10: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a2
            SeriesColor = 16744448
            Title = #1044#1072#1074#1083#1077#1085#1080#1077
            LinePen.Color = 16744448
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A2_P_PAR'
          end
          object FastLineSeries11: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a2
            SeriesColor = clLime
            Title = #1056#1072#1089#1093#1086#1076' '#1087#1072#1088#1072
            LinePen.Color = clLime
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A2_F_PAR'
          end
          object FastLineSeries12: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a2
            SeriesColor = clOlive
            Title = #1059#1088#1086#1074#1077#1085#1100' '#1082#1086#1085#1076#1077#1085#1089#1072#1090#1072
            LinePen.Color = clOlive
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A2_H_COND'
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 5
      Caption = 'autoklav3'
      object Panel07: TPanel
        Left = 0
        Top = 0
        Width = 1014
        Height = 662
        Align = alClient
        Caption = 'Panel07'
        TabOrder = 0
        object autoklav3: TDBChart
          Left = 1
          Top = 1
          Width = 1012
          Height = 660
          OnProcessRecord = DBChartProcessRecord
          AllowPanning = pmNone
          AllowZoom = False
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Foot.Text.Strings = (
            ' ')
          MarginBottom = 10
          MarginLeft = 5
          MarginRight = 5
          MarginTop = 5
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -12
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Title.Text.Strings = (
            #1040#1074#1090#1086#1082#1083#1072#1074' '#8470'3')
          OnClickBackground = DBChartClickBackground
          BottomAxis.DateTimeFormat = 'h:mm'
          BottomAxis.Increment = 0.000694444444444444
          BottomAxis.Inverted = True
          LeftAxis.Automatic = False
          LeftAxis.AutomaticMaximum = False
          LeftAxis.AutomaticMinimum = False
          LeftAxis.ExactDateTime = False
          LeftAxis.Increment = 5.000000000000000000
          LeftAxis.Maximum = 200.000000000000000000
          LeftAxis.Title.Angle = 0
          Legend.Alignment = laBottom
          Legend.DividingLines.Visible = True
          Legend.LegendStyle = lsSeries
          Legend.ResizeChart = False
          Legend.ShadowSize = 0
          Legend.TopPos = 0
          Legend.Visible = False
          MaxPointsPerPage = 900
          RightAxis.Title.Angle = 0
          ScaleLastPage = False
          View3D = False
          OnAfterDraw = DBChartAfterDraw
          Align = alClient
          TabOrder = 0
          DesignSize = (
            1012
            660)
          object STA30: TStaticText
            Left = 16
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clMoneyGreen
            ParentColor = False
            TabOrder = 0
          end
          object STA31: TStaticText
            Left = 156
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 1
          end
          object STA32: TStaticText
            Left = 292
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 33023
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 2
          end
          object STA33: TStaticText
            Left = 426
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clFuchsia
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 3
          end
          object STA34: TStaticText
            Left = 560
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 4
          end
          object STA35: TStaticText
            Left = 695
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clLime
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 5
          end
          object STA36: TStaticText
            Left = 832
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clOlive
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 6
          end
          object STA3D: TStaticText
            Left = 16
            Top = 598
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clMoneyGreen
            ParentColor = False
            TabOrder = 7
          end
          object StaticText13: TStaticText
            Left = 115
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1087#1072#1088#1072
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 8
            Transparent = False
          end
          object StaticText14: TStaticText
            Left = 250
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1074#1077#1088#1093#1085#1103#1103
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 41215
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 9
          end
          object StaticText15: TStaticText
            Left = 385
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1085#1080#1078#1085#1103#1103
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clFuchsia
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 10
          end
          object StaticText16: TStaticText
            Left = 519
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1044#1072#1074#1083#1077#1085#1080#1077
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 11
          end
          object StaticText17: TStaticText
            Left = 653
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1056#1072#1089#1093#1086#1076' '#1087#1072#1088#1072
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 12
          end
          object StaticText18: TStaticText
            Left = 788
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1059#1088#1086#1074#1077#1085#1100' '#1082#1086#1085#1076#1077#1085#1089#1072#1090#1072
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clOlive
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 13
          end
          object CBA31: TCheckBox
            Left = 140
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 14
            OnClick = ClickChecked
          end
          object CBA32: TCheckBox
            Left = 275
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 15
            OnClick = ClickChecked
          end
          object CBA33: TCheckBox
            Left = 409
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 16
            OnClick = ClickChecked
          end
          object CBA34: TCheckBox
            Left = 544
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 17
            OnClick = ClickChecked
          end
          object CBA35: TCheckBox
            Left = 678
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 18
            OnClick = ClickChecked
          end
          object CBA36: TCheckBox
            Left = 816
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 19
            OnClick = ClickChecked
          end
          object FastLineSeries5: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a3
            SeriesColor = clRed
            Title = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1087#1072#1088#1072
            LinePen.Color = clRed
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A3_T'
          end
          object FastLineSeries6: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a3
            SeriesColor = 33023
            Title = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1074#1077#1088#1093#1085#1103#1103
            LinePen.Color = 33023
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A3_T_TOP'
          end
          object FastLineSeries13: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a3
            SeriesColor = clFuchsia
            Title = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1085#1080#1078#1085#1103#1103
            LinePen.Color = clFuchsia
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A3_T_BOTTOM'
          end
          object FastLineSeries14: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a3
            SeriesColor = 16744448
            Title = #1044#1072#1074#1083#1077#1085#1080#1077
            LinePen.Color = 16744448
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A3_P_PAR'
          end
          object FastLineSeries15: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a3
            SeriesColor = clLime
            Title = #1056#1072#1089#1093#1086#1076' '#1087#1072#1088#1072
            LinePen.Color = clLime
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A3_F_PAR'
          end
          object FastLineSeries16: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a3
            SeriesColor = clOlive
            Title = #1059#1088#1086#1074#1077#1085#1100' '#1082#1086#1085#1076#1077#1085#1089#1072#1090#1072
            LinePen.Color = clOlive
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A3_H_COND'
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 6
      Caption = 'autoklav4'
      object Panel08: TPanel
        Left = 0
        Top = 0
        Width = 1014
        Height = 662
        Align = alClient
        Caption = 'Panel08'
        TabOrder = 0
        object autoklav4: TDBChart
          Left = 1
          Top = 1
          Width = 1012
          Height = 660
          OnProcessRecord = DBChartProcessRecord
          AllowPanning = pmNone
          AllowZoom = False
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Foot.Text.Strings = (
            ' ')
          LeftWall.Brush.Color = clWhite
          MarginBottom = 10
          MarginLeft = 5
          MarginRight = 5
          MarginTop = 5
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -12
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Title.Text.Strings = (
            #1040#1074#1090#1086#1082#1083#1072#1074' '#8470'4')
          OnClickBackground = DBChartClickBackground
          BottomAxis.DateTimeFormat = 'h:mm'
          BottomAxis.Increment = 0.000694444444444444
          BottomAxis.Inverted = True
          LeftAxis.Automatic = False
          LeftAxis.AutomaticMaximum = False
          LeftAxis.AutomaticMinimum = False
          LeftAxis.ExactDateTime = False
          LeftAxis.Increment = 5.000000000000000000
          LeftAxis.Maximum = 200.000000000000000000
          LeftAxis.Title.Angle = 0
          Legend.Alignment = laBottom
          Legend.DividingLines.Visible = True
          Legend.LegendStyle = lsSeries
          Legend.ResizeChart = False
          Legend.ShadowSize = 0
          Legend.TopPos = 0
          Legend.Visible = False
          MaxPointsPerPage = 900
          RightAxis.Title.Angle = 0
          ScaleLastPage = False
          View3D = False
          OnAfterDraw = DBChartAfterDraw
          Align = alClient
          TabOrder = 0
          DesignSize = (
            1012
            660)
          object STA40: TStaticText
            Left = 16
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clMoneyGreen
            ParentColor = False
            TabOrder = 0
          end
          object STA41: TStaticText
            Left = 156
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 1
          end
          object STA42: TStaticText
            Left = 292
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 33023
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 2
          end
          object STA43: TStaticText
            Left = 426
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clFuchsia
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 3
          end
          object STA44: TStaticText
            Left = 560
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 4
          end
          object STA45: TStaticText
            Left = 695
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clLime
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 5
          end
          object STA46: TStaticText
            Left = 832
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clOlive
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 6
          end
          object STA4D: TStaticText
            Left = 16
            Top = 598
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clMoneyGreen
            ParentColor = False
            TabOrder = 7
          end
          object StaticText19: TStaticText
            Left = 115
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1087#1072#1088#1072
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 8
            Transparent = False
          end
          object StaticText20: TStaticText
            Left = 250
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1074#1077#1088#1093#1085#1103#1103
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 41215
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 9
          end
          object StaticText21: TStaticText
            Left = 385
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1085#1080#1078#1085#1103#1103
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clFuchsia
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 10
          end
          object StaticText22: TStaticText
            Left = 519
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1044#1072#1074#1083#1077#1085#1080#1077
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 11
          end
          object StaticText23: TStaticText
            Left = 653
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1056#1072#1089#1093#1086#1076' '#1087#1072#1088#1072
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 12
          end
          object StaticText24: TStaticText
            Left = 788
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1059#1088#1086#1074#1077#1085#1100' '#1082#1086#1085#1076#1077#1085#1089#1072#1090#1072
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clOlive
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 13
          end
          object CBA41: TCheckBox
            Left = 140
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 14
            OnClick = ClickChecked
          end
          object CBA42: TCheckBox
            Left = 275
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 15
            OnClick = ClickChecked
          end
          object CBA43: TCheckBox
            Left = 409
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 16
            OnClick = ClickChecked
          end
          object CBA44: TCheckBox
            Left = 544
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 17
            OnClick = ClickChecked
          end
          object CBA45: TCheckBox
            Left = 678
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 18
            OnClick = ClickChecked
          end
          object CBA46: TCheckBox
            Left = 816
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 19
            OnClick = ClickChecked
          end
          object FastLineSeries7: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a4
            SeriesColor = clRed
            Title = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1087#1072#1088#1072
            LinePen.Color = clRed
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A4_T'
          end
          object FastLineSeries8: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a4
            SeriesColor = 33023
            Title = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1074#1077#1088#1093#1085#1103#1103
            LinePen.Color = 33023
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A4_T_TOP'
          end
          object FastLineSeries17: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a4
            SeriesColor = clFuchsia
            Title = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1085#1080#1078#1085#1103#1103
            LinePen.Color = clFuchsia
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A4_T_BOTTOM'
          end
          object FastLineSeries18: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a4
            SeriesColor = clBlue
            Title = #1044#1072#1074#1083#1077#1085#1080#1077
            LinePen.Color = clBlue
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A4_P_PAR'
          end
          object FastLineSeries19: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a4
            SeriesColor = clLime
            Title = #1056#1072#1089#1093#1086#1076' '#1087#1072#1088#1072
            LinePen.Color = clLime
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A4_F_PAR'
          end
          object FastLineSeries20: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a4
            SeriesColor = clOlive
            Title = #1059#1088#1086#1074#1077#1085#1100' '#1082#1086#1085#1076#1077#1085#1089#1072#1090#1072
            LinePen.Color = clOlive
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A4_H_COND'
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 7
      Caption = 'autoklav5'
      object Panel09: TPanel
        Left = 0
        Top = 0
        Width = 1014
        Height = 662
        Align = alClient
        Caption = 'Panel09'
        TabOrder = 0
        object autoklav5: TDBChart
          Left = 1
          Top = 1
          Width = 1012
          Height = 660
          OnProcessRecord = DBChartProcessRecord
          AllowPanning = pmNone
          AllowZoom = False
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Foot.Text.Strings = (
            ' ')
          LeftWall.Brush.Color = clWhite
          MarginBottom = 10
          MarginLeft = 5
          MarginRight = 5
          MarginTop = 5
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -12
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Title.Text.Strings = (
            #1040#1074#1090#1086#1082#1083#1072#1074' '#8470'5')
          OnClickBackground = DBChartClickBackground
          BottomAxis.DateTimeFormat = 'h:mm'
          BottomAxis.Increment = 0.000694444444444444
          BottomAxis.Inverted = True
          LeftAxis.Automatic = False
          LeftAxis.AutomaticMaximum = False
          LeftAxis.AutomaticMinimum = False
          LeftAxis.ExactDateTime = False
          LeftAxis.Increment = 5.000000000000000000
          LeftAxis.Maximum = 200.000000000000000000
          LeftAxis.Title.Angle = 0
          Legend.Alignment = laBottom
          Legend.DividingLines.Visible = True
          Legend.LegendStyle = lsSeries
          Legend.ResizeChart = False
          Legend.ShadowSize = 0
          Legend.TopPos = 0
          Legend.Visible = False
          MaxPointsPerPage = 900
          RightAxis.Title.Angle = 0
          ScaleLastPage = False
          View3D = False
          OnAfterDraw = DBChartAfterDraw
          Align = alClient
          TabOrder = 0
          DesignSize = (
            1012
            660)
          object STA5D: TStaticText
            Left = 16
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clMoneyGreen
            ParentColor = False
            TabOrder = 0
          end
          object STA51: TStaticText
            Left = 156
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 1
          end
          object STA52: TStaticText
            Left = 292
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 33023
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 2
          end
          object STA53: TStaticText
            Left = 426
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clFuchsia
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 3
          end
          object STA54: TStaticText
            Left = 560
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 4
          end
          object STA55: TStaticText
            Left = 695
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clLime
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 5
          end
          object STA56: TStaticText
            Left = 832
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clOlive
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 6
          end
          object STA50: TStaticText
            Left = 16
            Top = 598
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clMoneyGreen
            ParentColor = False
            TabOrder = 7
          end
          object StaticText39: TStaticText
            Left = 115
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1087#1072#1088#1072
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 8
            Transparent = False
          end
          object StaticText40: TStaticText
            Left = 250
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1074#1077#1088#1093#1085#1103#1103
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 41215
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 9
          end
          object StaticText41: TStaticText
            Left = 385
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1085#1080#1078#1085#1103#1103
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clFuchsia
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 10
          end
          object StaticText42: TStaticText
            Left = 519
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1044#1072#1074#1083#1077#1085#1080#1077
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 11
          end
          object StaticText43: TStaticText
            Left = 653
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1056#1072#1089#1093#1086#1076' '#1087#1072#1088#1072
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 12
          end
          object StaticText44: TStaticText
            Left = 788
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1059#1088#1086#1074#1077#1085#1100' '#1082#1086#1085#1076#1077#1085#1089#1072#1090#1072
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clOlive
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 13
          end
          object CBA51: TCheckBox
            Left = 140
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 14
            OnClick = ClickChecked
          end
          object CBA52: TCheckBox
            Left = 275
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 15
            OnClick = ClickChecked
          end
          object CBA53: TCheckBox
            Left = 409
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 16
            OnClick = ClickChecked
          end
          object CBA54: TCheckBox
            Left = 544
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 17
            OnClick = ClickChecked
          end
          object CBA55: TCheckBox
            Left = 678
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 18
            OnClick = ClickChecked
          end
          object CBA56: TCheckBox
            Left = 816
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 19
            OnClick = ClickChecked
          end
          object FastLineSeries21: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a5
            SeriesColor = clRed
            Title = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1087#1072#1088#1072
            LinePen.Color = clRed
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A5_T'
          end
          object FastLineSeries22: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a5
            SeriesColor = 33023
            Title = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1074#1077#1088#1093#1085#1103#1103
            LinePen.Color = 33023
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A5_T_TOP'
          end
          object FastLineSeries23: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a5
            SeriesColor = clFuchsia
            Title = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1085#1080#1078#1085#1103#1103
            LinePen.Color = clFuchsia
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A5_T_BOTTOM'
          end
          object FastLineSeries24: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a5
            SeriesColor = clBlue
            Title = #1044#1072#1074#1083#1077#1085#1080#1077
            LinePen.Color = clBlue
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A5_P_PAR'
          end
          object FastLineSeries25: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a5
            SeriesColor = clLime
            Title = #1056#1072#1089#1093#1086#1076' '#1087#1072#1088#1072
            LinePen.Color = clLime
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A5_F_PAR'
          end
          object FastLineSeries26: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a5
            SeriesColor = clOlive
            Title = #1059#1088#1086#1074#1077#1085#1100' '#1082#1086#1085#1076#1077#1085#1089#1072#1090#1072
            LinePen.Color = clOlive
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A5_H_COND'
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 8
      Caption = 'autoklav6'
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 1014
        Height = 662
        Align = alClient
        Caption = 'Panel10'
        TabOrder = 0
        object autoklav6: TDBChart
          Left = 1
          Top = 1
          Width = 1012
          Height = 660
          OnProcessRecord = DBChartProcessRecord
          AllowPanning = pmNone
          AllowZoom = False
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Foot.Text.Strings = (
            ' ')
          LeftWall.Brush.Color = clWhite
          MarginBottom = 10
          MarginLeft = 5
          MarginRight = 5
          MarginTop = 5
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -12
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Title.Text.Strings = (
            #1040#1074#1090#1086#1082#1083#1072#1074' '#8470'6')
          OnClickBackground = DBChartClickBackground
          BottomAxis.DateTimeFormat = 'h:mm'
          BottomAxis.Increment = 0.000694444444444444
          BottomAxis.Inverted = True
          LeftAxis.Automatic = False
          LeftAxis.AutomaticMaximum = False
          LeftAxis.AutomaticMinimum = False
          LeftAxis.ExactDateTime = False
          LeftAxis.Increment = 5.000000000000000000
          LeftAxis.Maximum = 200.000000000000000000
          LeftAxis.Title.Angle = 0
          Legend.Alignment = laBottom
          Legend.DividingLines.Visible = True
          Legend.LegendStyle = lsSeries
          Legend.ResizeChart = False
          Legend.ShadowSize = 0
          Legend.TopPos = 0
          Legend.Visible = False
          MaxPointsPerPage = 900
          RightAxis.Title.Angle = 0
          ScaleLastPage = False
          View3D = False
          OnAfterDraw = DBChartAfterDraw
          Align = alClient
          TabOrder = 0
          DesignSize = (
            1012
            660)
          object STA6D: TStaticText
            Left = 16
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clMoneyGreen
            ParentColor = False
            TabOrder = 0
          end
          object STA61: TStaticText
            Left = 156
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 1
          end
          object STA62: TStaticText
            Left = 292
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 33023
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 2
          end
          object STA63: TStaticText
            Left = 426
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clFuchsia
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 3
          end
          object STA64: TStaticText
            Left = 560
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 4
          end
          object STA65: TStaticText
            Left = 695
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clLime
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 5
          end
          object STA66: TStaticText
            Left = 832
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clOlive
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 6
          end
          object STA60: TStaticText
            Left = 16
            Top = 598
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clMoneyGreen
            ParentColor = False
            TabOrder = 7
          end
          object StaticText53: TStaticText
            Left = 115
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1087#1072#1088#1072
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 8
            Transparent = False
          end
          object StaticText54: TStaticText
            Left = 250
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1074#1077#1088#1093#1085#1103#1103
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 41215
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 9
          end
          object StaticText55: TStaticText
            Left = 385
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1085#1080#1078#1085#1103#1103
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clFuchsia
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 10
          end
          object StaticText56: TStaticText
            Left = 519
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1044#1072#1074#1083#1077#1085#1080#1077
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 11
          end
          object StaticText57: TStaticText
            Left = 653
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1056#1072#1089#1093#1086#1076' '#1087#1072#1088#1072
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 12
          end
          object StaticText58: TStaticText
            Left = 788
            Top = 598
            Width = 138
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1059#1088#1086#1074#1077#1085#1100' '#1082#1086#1085#1076#1077#1085#1089#1072#1090#1072
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clOlive
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 13
          end
          object CBA61: TCheckBox
            Left = 140
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 14
            OnClick = ClickChecked
          end
          object CBA62: TCheckBox
            Left = 275
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 15
            OnClick = ClickChecked
          end
          object CBA63: TCheckBox
            Left = 409
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 16
            OnClick = ClickChecked
          end
          object CBA64: TCheckBox
            Left = 544
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 17
            OnClick = ClickChecked
          end
          object CBA65: TCheckBox
            Left = 678
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 18
            OnClick = ClickChecked
          end
          object CBA66: TCheckBox
            Left = 816
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 19
            OnClick = ClickChecked
          end
          object FastLineSeries27: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a6
            SeriesColor = clRed
            Title = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1087#1072#1088#1072
            LinePen.Color = clRed
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A6_T'
          end
          object FastLineSeries28: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a6
            SeriesColor = 33023
            Title = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1074#1077#1088#1093#1085#1103#1103
            LinePen.Color = 33023
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A6_T_TOP'
          end
          object FastLineSeries29: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a6
            SeriesColor = clFuchsia
            Title = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1085#1080#1078#1085#1103#1103
            LinePen.Color = clFuchsia
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A6_T_BOTTOM'
          end
          object FastLineSeries30: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a6
            SeriesColor = clBlue
            Title = #1044#1072#1074#1083#1077#1085#1080#1077
            LinePen.Color = clBlue
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A6_P_PAR'
          end
          object FastLineSeries31: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a6
            SeriesColor = clLime
            Title = #1056#1072#1089#1093#1086#1076' '#1087#1072#1088#1072
            LinePen.Color = clLime
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A6_F_PAR'
          end
          object FastLineSeries32: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_a6
            SeriesColor = clOlive
            Title = #1059#1088#1086#1074#1077#1085#1100' '#1082#1086#1085#1076#1077#1085#1089#1072#1090#1072
            LinePen.Color = clOlive
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'A6_H_COND'
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 9
      Caption = 'TempDoz2'
      object Panel11: TPanel
        Left = 0
        Top = 0
        Width = 1014
        Height = 662
        Align = alClient
        TabOrder = 0
        object DBChart11: TDBChart
          Left = 1
          Top = 1
          Width = 1012
          Height = 660
          OnProcessRecord = DBChartProcessRecord
          AllowPanning = pmNone
          AllowZoom = False
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Foot.Text.Strings = (
            ' ')
          MarginBottom = 10
          MarginLeft = 5
          MarginRight = 5
          MarginTop = 5
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -12
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Title.Text.Strings = (
            #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1099' '#1091#1095#1072#1089#1090#1082#1072' '#1076#1086#1079#1080#1088#1086#1074#1086#1082' N2')
          OnClickBackground = DBChartClickBackground
          BottomAxis.DateTimeFormat = 'h:mm'
          BottomAxis.Increment = 0.000694444444444444
          BottomAxis.Inverted = True
          LeftAxis.Automatic = False
          LeftAxis.AutomaticMaximum = False
          LeftAxis.AutomaticMinimum = False
          LeftAxis.ExactDateTime = False
          LeftAxis.Increment = 5.000000000000000000
          LeftAxis.LabelStyle = talValue
          LeftAxis.Maximum = 100.000000000000000000
          LeftAxis.Title.Angle = 0
          Legend.Alignment = laBottom
          Legend.DividingLines.Visible = True
          Legend.LegendStyle = lsSeries
          Legend.ResizeChart = False
          Legend.ShadowSize = 0
          Legend.TopPos = 0
          Legend.Visible = False
          MaxPointsPerPage = 900
          RightAxis.Title.Angle = 0
          ScaleLastPage = False
          View3D = False
          View3DOptions.ZoomText = False
          OnAfterDraw = DBChartAfterDraw
          Align = alClient
          TabOrder = 0
          DesignSize = (
            1012
            660)
          object DZ2STT: TStaticText
            Left = 16
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clMoneyGreen
            ParentColor = False
            TabOrder = 0
          end
          object DZ2STV3: TStaticText
            Left = 317
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 1
          end
          object DZ2STV4: TStaticText
            Left = 412
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 33023
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 2
          end
          object DZ2STD: TStaticText
            Left = 16
            Top = 598
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clMoneyGreen
            ParentColor = False
            TabOrder = 3
          end
          object DZ2ST3: TStaticText
            Left = 300
            Top = 598
            Width = 75
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058' '#1096#1083#1072#1084#1072
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 4
          end
          object DZ2ST4: TStaticText
            Left = 395
            Top = 598
            Width = 75
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058' '#1086#1073#1088' '#1096#1083#1072#1084#1072
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 28927
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 5
          end
          object DZ2CB3: TCheckBox
            Left = 300
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 6
            OnClick = ClickChecked
          end
          object DZ2CB4: TCheckBox
            Left = 395
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 7
            OnClick = ClickChecked
          end
          object DZ2STV1: TStaticText
            Left = 127
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clPurple
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 8
          end
          object DZ2STV2: TStaticText
            Left = 222
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 9
          end
          object DZ2ST1: TStaticText
            Left = 110
            Top = 598
            Width = 75
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058' '#1075#1086#1088' '#1074#1086#1076#1099
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clPurple
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 10
          end
          object DZ2ST2: TStaticText
            Left = 205
            Top = 598
            Width = 75
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058' '#1093#1086#1083' '#1074#1086#1076#1099
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 11
          end
          object DZ2CB1: TCheckBox
            Left = 110
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 12
            OnClick = ClickChecked
          end
          object DZ2CB2: TCheckBox
            Left = 205
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 13
            OnClick = ClickChecked
          end
          object DZ2STV6: TStaticText
            Left = 602
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 14
          end
          object DZ2STV5: TStaticText
            Left = 507
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clOlive
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 15
          end
          object DZ2ST6: TStaticText
            Left = 585
            Top = 598
            Width = 75
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058' '#1072#1083' '#1089#1091#1089#1087' '#1084'2'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 16
          end
          object DZ2ST5: TStaticText
            Left = 490
            Top = 598
            Width = 75
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058' '#1072#1083' '#1089#1091#1089#1087' '#1084'1'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clOlive
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 17
          end
          object DZ2CB6: TCheckBox
            Left = 585
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 18
            OnClick = ClickChecked
          end
          object DZ2CB5: TCheckBox
            Left = 490
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 19
            OnClick = ClickChecked
          end
          object DZ2CB7: TCheckBox
            Left = 680
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 20
            OnClick = ClickChecked
          end
          object DZ2CB8: TCheckBox
            Left = 775
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 21
            OnClick = ClickChecked
          end
          object DZ2STV8: TStaticText
            Left = 792
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 22
          end
          object DZ2STV7: TStaticText
            Left = 697
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 23
          end
          object DZ2ST7: TStaticText
            Left = 680
            Top = 598
            Width = 75
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058' '#1094#1077#1084#1077#1085#1090#1072
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 24
          end
          object DZ2ST8: TStaticText
            Left = 775
            Top = 598
            Width = 75
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058' '#1074#1103#1078#1091#1097#1080#1093
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 25
          end
          object DZ2ST9: TStaticText
            Left = 870
            Top = 598
            Width = 75
            Height = 17
            Alignment = taCenter
            Anchors = []
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = #1058' '#1042#1043#1041#1052
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 26
          end
          object DZ2STV9: TStaticText
            Left = 887
            Top = 627
            Width = 58
            Height = 17
            Alignment = taCenter
            Anchors = [akBottom]
            AutoSize = False
            BorderStyle = sbsSingle
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 27
          end
          object DZ2CB9: TCheckBox
            Left = 870
            Top = 626
            Width = 15
            Height = 15
            Anchors = []
            Checked = True
            Color = clBtnFace
            Ctl3D = False
            ParentColor = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 28
            OnClick = ClickChecked
          end
          object FastLineSeries33: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_tds
            SeriesColor = clPurple
            Title = #1058' '#1075#1086#1088' '#1074#1086#1076#1099
            LinePen.Color = clPurple
            LinePen.Width = 2
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'AIT092___V'
          end
          object FastLineSeries34: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_tds
            SeriesColor = 10485760
            Title = #1058' '#1093#1086#1083' '#1074#1086#1076#1099
            LinePen.Color = 10485760
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'AIT091___V'
          end
          object FastLineSeries35: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_tds
            SeriesColor = clRed
            Title = #1058' '#1096#1083#1072#1084#1072
            LinePen.Color = clRed
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'AIT064___V'
          end
          object FastLineSeries36: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_tds
            SeriesColor = 33023
            Title = #1058' '#1086#1073#1088' '#1096#1083#1072#1084#1072
            LinePen.Color = 33023
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'AIT056___V'
          end
          object FastLineSeries37: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_tds
            SeriesColor = clOlive
            Title = #1058' '#1072#1083' '#1089#1091#1089#1087' '#1084'1'
            LinePen.Color = clOlive
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'AIT068___V'
          end
          object FastLineSeries38: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_tds
            SeriesColor = clGray
            Title = #1058' '#1072#1083' '#1089#1091#1089#1087' '#1084'2'
            LinePen.Color = clGray
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'AIT069___V'
          end
          object FastLineSeries39: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_tds
            SeriesColor = 8421440
            Title = #1058' '#1094#1077#1084#1077#1085#1090#1072
            LinePen.Color = 8421440
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'AIT233___V'
          end
          object FastLineSeries40: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_tds
            SeriesColor = clGreen
            Title = #1058' '#1074#1103#1078#1091#1097#1080#1093
            LinePen.Color = clGreen
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'AIT231___V'
          end
          object FastLineSeries41: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = DM.IBQ_gr_tds
            SeriesColor = clBlack
            Title = #1058' '#1042#1043#1041#1052
            LinePen.Width = 2
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            XValues.ValueSource = 'TIME_INSERT'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'AIT202___V'
          end
        end
      end
    end
  end
  object Panel01: TPanel
    Left = 0
    Top = 662
    Width = 1014
    Height = 53
    Align = alBottom
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 443
      Top = 13
      Width = 90
      Height = 23
      Caption = #1058#1077#1082#1091#1097#1080#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 568
      Top = 13
      Width = 23
      Height = 23
      Caption = '<'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 597
      Top = 13
      Width = 23
      Height = 23
      Caption = '>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Layout = blGlyphRight
      ParentFont = False
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 116
      Top = 13
      Width = 90
      Height = 23
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton4Click
    end
    object SpeedButton5: TSpeedButton
      Left = 689
      Top = 13
      Width = 90
      Height = 23
      Caption = #1064#1082#1072#1083#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton5Click
    end
    object SpeedButton6: TSpeedButton
      Left = 321
      Top = 13
      Width = 90
      Height = 23
      Caption = #1055#1077#1088#1077#1081#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton6Click
    end
    object SpeedButton7: TSpeedButton
      Left = 810
      Top = 13
      Width = 23
      Height = 23
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton7Click
    end
    object SpeedButton8: TSpeedButton
      Left = 839
      Top = 13
      Width = 23
      Height = 23
      Caption = '~'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton8Click
    end
    object SpeedButton9: TSpeedButton
      Left = 905
      Top = 13
      Width = 90
      Height = 23
      Caption = #1055#1077#1095#1072#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton9Click
    end
    object dat: TDateEdit
      Left = 13
      Top = 14
      Width = 95
      Height = 21
      ButtonWidth = 20
      NumGlyphs = 2
      TabOrder = 0
      OnChange = datChange
    end
    object tim: TDateTimePicker
      Left = 238
      Top = 14
      Width = 73
      Height = 21
      Date = 38169.000000000000000000
      Time = 38169.000000000000000000
      Kind = dtkTime
      TabOrder = 1
      OnChange = timChange
    end
  end
  object TNQ: TIBQuery
    Database = DM.IBDatabase1
    Transaction = DM.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT RDB$RELATION_NAME FROM RDB$RELATIONS')
    Left = 6
    Top = 6
  end
end

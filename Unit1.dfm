object Form1: TForm1
  Left = 99
  Top = 26
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Capture Webcam'
  ClientHeight = 681
  ClientWidth = 1321
  Color = clGradientActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 176
    Top = 0
    Width = 1005
    Height = 43
    Caption = 'APLIKASI PENANGKAP PELANGGAR LALU LINTAS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -40
    Font.Name = 'MS Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape1: TShape
    Left = 1280
    Top = 46
    Width = 25
    Height = 35
    Shape = stCircle
  end
  object Shape3: TShape
    Left = 1232
    Top = 46
    Width = 25
    Height = 35
    Shape = stCircle
  end
  object Shape4: TShape
    Left = 1184
    Top = 46
    Width = 25
    Height = 35
    Shape = stCircle
  end
  object GroupBox1: TGroupBox
    Left = 608
    Top = 96
    Width = 713
    Height = 361
    Caption = 'Camera CCTV'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'MS Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object VideoWindow1: TVideoWindow
      Left = 2
      Top = 29
      Width = 709
      Height = 330
      FilterGraph = FilterGraph1
      VMROptions.Mode = vmrWindowed
      Color = clBlack
      Align = alClient
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 80
    Width = 601
    Height = 505
    Caption = 'Gambar Pelanggar Tertangkap'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'MS Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Image1: TImage
      Left = 8
      Top = 32
      Width = 577
      Height = 465
      Stretch = True
    end
    object Image2: TImage
      Left = 8
      Top = 32
      Width = 577
      Height = 465
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 584
    Width = 593
    Height = 97
    Caption = 'SETTING'
    Font.Charset = ANSI_CHARSET
    Font.Color = clAqua
    Font.Height = -24
    Font.Name = 'MS Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Shape2: TShape
      Left = 286
      Top = 64
      Width = 33
      Height = 25
      Shape = stRoundRect
    end
    object Button1: TButton
      Left = 16
      Top = 64
      Width = 81
      Height = 25
      Caption = 'TEST'
      Font.Charset = ANSI_CHARSET
      Font.Color = clAqua
      Font.Height = -13
      Font.Name = 'MS Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object ComboBox1: TComboBox
      Left = 19
      Top = 31
      Width = 150
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 1
      Text = ' -- Pilih --'
      OnSelect = ComboBox1Click
    end
    object Button2: TButton
      Left = 328
      Top = 32
      Width = 105
      Height = 25
      Caption = 'CONNECT'
      Font.Charset = ANSI_CHARSET
      Font.Color = clAqua
      Font.Height = -13
      Font.Name = 'MS Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 240
      Top = 32
      Width = 75
      Height = 25
      Caption = 'PORT'
      Font.Charset = ANSI_CHARSET
      Font.Color = clAqua
      Font.Height = -13
      Font.Name = 'MS Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 328
      Top = 64
      Width = 105
      Height = 25
      Caption = 'UNCONNECT'
      Font.Charset = ANSI_CHARSET
      Font.Color = clAqua
      Font.Height = -13
      Font.Name = 'MS Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = Button4Click
    end
    object StaticText1: TStaticText
      Left = 238
      Top = 64
      Width = 46
      Height = 27
      Caption = 'USB'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -20
      Font.Name = 'MS Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object Button6: TButton
      Left = 112
      Top = 64
      Width = 81
      Height = 25
      Caption = 'CLOSE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clAqua
      Font.Height = -13
      Font.Name = 'MS Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = Button6Click
    end
    object Edit1: TEdit
      Left = 200
      Top = 32
      Width = 25
      Height = 35
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -23
      Font.Name = 'MS Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
  end
  object DBGrid1: TDBGrid
    Left = 632
    Top = 480
    Width = 320
    Height = 120
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object FilterGraph1: TFilterGraph
    Mode = gmCapture
    GraphEdit = True
    LinearVolume = True
    Left = 8
    Top = 6
  end
  object SampleGrabber1: TSampleGrabber
    FilterGraph = FilterGraph1
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 40
    Top = 6
  end
  object Filter1: TFilter
    BaseFilter.data = {00000000}
    FilterGraph = FilterGraph1
    Left = 8
    Top = 46
  end
  object SavePictureDialog1: TSavePictureDialog
    DefaultExt = 'JPG'
    Left = 40
    Top = 46
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 72
    Top = 6
  end
  object ComPort1: TComPort
    BaudRate = br9600
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    StoredProps = [spBasic]
    TriggersOnRxChar = True
    OnRxChar = ComPort1RxChar
    Left = 104
    Top = 8
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=trafi' +
      'g'
    DefaultDatabase = 'pelanggaran_db'
    Left = 88
    Top = 48
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select *from tb_pelanggaran')
    Left = 136
    Top = 48
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 176
    Top = 48
  end
end

object frmViewMain: TfrmViewMain
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 561
  ClientWidth = 1009
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 78
    Width = 1003
    Height = 15
    Align = alTop
    Caption = 
      'Clique com o bot'#227'o direito do mouse para cadastrar pesagem/morta' +
      'lidade'
    Color = clBackground
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5197647
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ExplicitTop = 83
    ExplicitWidth = 395
  end
  object Label2: TLabel
    AlignWithMargins = True
    Left = 8
    Top = 491
    Width = 993
    Height = 20
    Margins.Left = 8
    Margins.Top = 0
    Margins.Right = 8
    Margins.Bottom = 0
    Align = alBottom
    Caption = 'Saude do Lote'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 96
  end
  object pHeader: TPanel
    Left = 0
    Top = 0
    Width = 1009
    Height = 75
    Align = alTop
    BevelOuter = bvNone
    Color = 16051947
    ParentBackground = False
    TabOrder = 0
    object lblTitle: TLabel
      AlignWithMargins = True
      Left = 8
      Top = 15
      Width = 100
      Height = 45
      Margins.Left = 8
      Margins.Top = 15
      Margins.Right = 0
      Margins.Bottom = 15
      Align = alLeft
      AutoSize = False
      Caption = 'Lotes'
      Font.Charset = ANSI_CHARSET
      Font.Color = 5585461
      Font.Height = -29
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 0
      ExplicitHeight = 50
    end
    object pBtnDelete: TPanel
      AlignWithMargins = True
      Left = 884
      Top = 20
      Width = 110
      Height = 35
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      Align = alRight
      BevelOuter = bvNone
      Color = 6906591
      ParentBackground = False
      TabOrder = 0
      ExplicitLeft = 859
      ExplicitHeight = 40
      object sBtnDelete: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 35
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Excluir'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 72
        ExplicitTop = 8
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pBtnAdd: TPanel
      AlignWithMargins = True
      Left = 634
      Top = 20
      Width = 110
      Height = 35
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      Align = alRight
      BevelOuter = bvNone
      Color = 16475988
      ParentBackground = False
      TabOrder = 1
      ExplicitLeft = 609
      ExplicitHeight = 40
      object sBtnAdd: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 35
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Adicionar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = sBtnAddClick
        ExplicitLeft = 72
        ExplicitTop = 8
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pBtnEdit: TPanel
      AlignWithMargins = True
      Left = 759
      Top = 20
      Width = 110
      Height = 35
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      Align = alRight
      BevelOuter = bvNone
      Color = 16475988
      ParentBackground = False
      TabOrder = 2
      ExplicitLeft = 734
      ExplicitHeight = 40
      object sBtnEdit: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 35
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Editar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = sBtnEditClick
        ExplicitLeft = 72
        ExplicitTop = 8
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pFilter: TPanel
      AlignWithMargins = True
      Left = 108
      Top = 0
      Width = 481
      Height = 75
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 45
      Margins.Bottom = 0
      Align = alClient
      BevelOuter = bvNone
      Color = 16051947
      ParentBackground = False
      TabOrder = 3
      ExplicitWidth = 456
      ExplicitHeight = 80
      object pBtnFilter: TPanel
        AlignWithMargins = True
        Left = 356
        Top = 20
        Width = 110
        Height = 35
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 15
        Margins.Bottom = 20
        Align = alRight
        BevelOuter = bvNone
        Color = 16475988
        ParentBackground = False
        TabOrder = 0
        ExplicitLeft = 331
        ExplicitHeight = 40
        object sBtnFilter: TSpeedButton
          Left = 0
          Top = 0
          Width = 110
          Height = 35
          Cursor = crHandPoint
          Align = alClient
          Caption = 'Filtrar'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = sBtnFilterClick
          ExplicitLeft = 72
          ExplicitTop = 8
          ExplicitWidth = 23
          ExplicitHeight = 22
        end
      end
      object edtFilter: TEdit
        AlignWithMargins = True
        Left = 0
        Top = 20
        Width = 356
        Height = 35
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 0
        Margins.Bottom = 20
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ExplicitWidth = 331
        ExplicitHeight = 38
      end
    end
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 96
    Width = 1009
    Height = 395
    Align = alClient
    DataSource = DataSource
    PopupMenu = PopupMenu
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = DBGridDrawColumnCell
  end
  object Panel1: TPanel
    Left = 0
    Top = 511
    Width = 1009
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    Color = 16051947
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 517
    object pWhite: TPanel
      AlignWithMargins = True
      Left = 8
      Top = 8
      Width = 100
      Height = 34
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alLeft
      Caption = 'Nenhuma Morte'
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
    end
    object pGreen: TPanel
      AlignWithMargins = True
      Left = 124
      Top = 8
      Width = 100
      Height = 34
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alLeft
      Caption = 'Menos de 5%'
      Color = clGreen
      ParentBackground = False
      TabOrder = 1
      ExplicitLeft = 240
      ExplicitTop = 11
    end
    object pYellow: TPanel
      AlignWithMargins = True
      Left = 240
      Top = 8
      Width = 100
      Height = 34
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alLeft
      Caption = 'Entre 5% e 10%'
      Color = clYellow
      ParentBackground = False
      TabOrder = 2
      ExplicitLeft = 472
      ExplicitTop = 11
    end
    object pRed: TPanel
      AlignWithMargins = True
      Left = 356
      Top = 8
      Width = 100
      Height = 34
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alLeft
      Caption = 'Mais de 10%'
      Color = clRed
      ParentBackground = False
      TabOrder = 3
      ExplicitLeft = 504
      ExplicitTop = 11
    end
  end
  object DataSource: TDataSource
    Left = 488
    Top = 288
  end
  object PopupMenu: TPopupMenu
    Left = 648
    Top = 200
    object editPesagem: TMenuItem
      Caption = 'Pesagem'
      OnClick = editPesagemClick
    end
    object editMortalidade: TMenuItem
      Caption = 'Mortalidade'
      OnClick = editMortalidadeClick
    end
  end
end

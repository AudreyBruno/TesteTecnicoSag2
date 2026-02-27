object frmViewCadBase: TfrmViewCadBase
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmViewCadBase'
  ClientHeight = 480
  ClientWidth = 640
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnClose = FormClose
  TextHeight = 15
  object Label1: TLabel
    AlignWithMargins = True
    Left = 8
    Top = 8
    Width = 624
    Height = 36
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 0
    Align = alTop
    Caption = 'Formulario de Cadastro Base'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 36
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 327
  end
  object pFooter: TPanel
    Left = 0
    Top = 425
    Width = 640
    Height = 55
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object pBtnCancel: TPanel
      AlignWithMargins = True
      Left = 390
      Top = 8
      Width = 110
      Height = 39
      Margins.Left = 0
      Margins.Top = 8
      Margins.Right = 15
      Margins.Bottom = 8
      Align = alRight
      BevelOuter = bvNone
      Color = 6906591
      ParentBackground = False
      TabOrder = 0
      object sBtnCancel: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 39
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Cancelar'
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
    object pBtnSave: TPanel
      AlignWithMargins = True
      Left = 515
      Top = 8
      Width = 110
      Height = 39
      Margins.Left = 0
      Margins.Top = 8
      Margins.Right = 15
      Margins.Bottom = 8
      Align = alRight
      BevelOuter = bvNone
      Color = 16475988
      ParentBackground = False
      TabOrder = 1
      object sBtnSave: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 39
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Salvar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = sBtnSaveClick
        ExplicitLeft = 72
        ExplicitTop = 8
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
  end
end

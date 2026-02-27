inherited frmViewEditMortalidade: TfrmViewEditMortalidade
  Caption = 'frmViewEditMortalidade'
  StyleElements = [seFont, seClient, seBorder]
  OnShow = FormShow
  TextHeight = 15
  inherited lblTitle: TLabel
    Caption = 'Nova Mortalidade'
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 204
  end
  object Label1: TLabel [1]
    Left = 40
    Top = 56
    Width = 75
    Height = 15
    Caption = 'Data Pesagem'
  end
  object Label2: TLabel [2]
    Left = 40
    Top = 120
    Width = 97
    Height = 15
    Caption = 'Quantidade Morta'
  end
  object Label3: TLabel [3]
    Left = 40
    Top = 184
    Width = 62
    Height = 15
    Caption = 'Observa'#231#227'o'
  end
  inherited pFooter: TPanel
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 295
    ExplicitWidth = 460
    inherited pBtnCancel: TPanel
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 210
    end
    inherited pBtnSave: TPanel
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 335
    end
  end
  object edtDate: TDateTimePicker
    Left = 40
    Top = 77
    Width = 186
    Height = 23
    Date = 46080.000000000000000000
    Time = 0.482455219906114500
    TabOrder = 1
  end
  object edtQtd: TEdit
    Left = 40
    Top = 141
    Width = 186
    Height = 23
    TabOrder = 2
  end
  object edtObs: TEdit
    Left = 40
    Top = 205
    Width = 186
    Height = 23
    TabOrder = 3
  end
end

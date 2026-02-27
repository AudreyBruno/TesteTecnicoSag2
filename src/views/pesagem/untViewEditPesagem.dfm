inherited frmViewEditPesagem: TfrmViewEditPesagem
  Caption = 'frmViewEditPesagem'
  StyleElements = [seFont, seClient, seBorder]
  OnShow = FormShow
  TextHeight = 15
  inherited lblTitle: TLabel
    Caption = 'Nova Pesagem'
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 169
  end
  object Label2: TLabel [1]
    Left = 40
    Top = 120
    Width = 62
    Height = 15
    Caption = 'Peso M'#233'dio'
  end
  object Label1: TLabel [2]
    Left = 40
    Top = 56
    Width = 75
    Height = 15
    Caption = 'Data Pesagem'
  end
  object Label3: TLabel [3]
    Left = 40
    Top = 184
    Width = 96
    Height = 15
    Caption = 'Quantidade Inicial'
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
  object edtPesoMedio: TEdit
    Left = 40
    Top = 141
    Width = 186
    Height = 23
    TabOrder = 1
  end
  object edtDate: TDateTimePicker
    Left = 40
    Top = 77
    Width = 186
    Height = 23
    Date = 46080.000000000000000000
    Time = 0.482455219906114500
    TabOrder = 2
  end
  object edtQtd: TEdit
    Left = 40
    Top = 205
    Width = 186
    Height = 23
    TabOrder = 3
  end
end

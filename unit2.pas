unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Menus;

type

  { TCollorBucketWindows }

  TCollorBucketWindows = class(TForm)
    ButtonAutoColorGen: TButton;
    ButtonApplyColor: TButton;
    ButtonCancel: TButton;
    ComboBox1: TComboBox;
    ComboBox10: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    Image1: TImage;
    Image10: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Label1: TLabel;
    procedure ApplyColorsAp(Sender: TObject);
    procedure CancelColorCh(Sender: TObject);
    procedure CheckColorsCh(Sender: TObject);
    procedure Form2Create(Sender: TObject);
  private

  public

  end;

var
  CollorBucketWindows: TCollorBucketWindows;
  FlagCheck: Boolean;

implementation

{$R *.lfm}

{ TCollorBucketWindows }

procedure TCollorBucketWindows.Form2Create(Sender: TObject);
begin
  image1.Picture.LoadFromFile('empty_metall.png');
  Image2.Picture.LoadFromFile('empty_metall.png');
  Image3.Picture.LoadFromFile('empty_metall.png');
  image4.Picture.LoadFromFile('empty_metall.png');
  Image5.Picture.LoadFromFile('empty_metall.png');
  Image6.Picture.LoadFromFile('empty_metall.png');
  image7.Picture.LoadFromFile('empty_metall.png');
  Image8.Picture.LoadFromFile('empty_metall.png');
  Image9.Picture.LoadFromFile('empty_metall.png');
  Image10.Picture.LoadFromFile('empty_metall.png');
end;

procedure TCollorBucketWindows.CancelColorCh(Sender: TObject);
begin
  Close;
end;

procedure TCollorBucketWindows.CheckColorsCh(Sender: TObject);
begin
     FlagCheck:=True;
end;

procedure TCollorBucketWindows.ApplyColorsAp(Sender: TObject);
begin
   if FlagCheck then
      begin
        FlagCheck := False;
        Close;
      end
      else
       ShowMessage ('Выполните проверку цветов!');
end;

end.


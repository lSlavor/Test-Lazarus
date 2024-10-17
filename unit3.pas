unit Unit3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TFillBucketWindow }

  TFillBucketWindow = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ButtonCancel: TButton;
    ComboBox1: TComboBox;
    ComboBox10: TComboBox;
    ComboBox11: TComboBox;
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
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure ApplyWaterButton(Sender: TObject);
    procedure AutoGenWater(Sender: TObject);
    procedure CancelButton(Sender: TObject);
    procedure CreateForm3(Sender: TObject);
    procedure DefaultWater(Sender: TObject);
    procedure InAllWater(Sender: TObject);
    procedure WaterBox1(Sender: TObject);
    procedure WaterBox10(Sender: TObject);
    procedure WaterBox2(Sender: TObject);
    procedure WaterBox3(Sender: TObject);
    procedure WaterBox4(Sender: TObject);
    procedure WaterBox5(Sender: TObject);
    procedure WaterBox6(Sender: TObject);
    procedure WaterBox7(Sender: TObject);
    procedure WaterBox8(Sender: TObject);
    procedure WaterBox9(Sender: TObject);
    procedure LoadTempBucketWaterImage(BucketIndex: Integer; ImageControl: TImage);
  private

  public

  end;

var
  FillBucketWindow: TFillBucketWindow; Test: String;
  ComboBoxesSetWaterr: array[1..10] of TComboBox;
  TempWaterIndex: array[1..10] of Integer;

implementation

{$R *.lfm}

{ TFillBucketWindow }


uses Unit1;


procedure LoadBucketImage3(BucketIndex: Integer; ImageControl: TImage);
var
  ImagePath: string;
begin
  if Buckets[BucketIndex].WaterLevel = 0 then
    ImagePath := BucketEmptyImages[Buckets[BucketIndex].ColorIndex]
  else
    ImagePath := BucketFilledImages[Buckets[BucketIndex].ColorIndex];

  ImageControl.Picture.LoadFromFile(ImagePath);
end;


procedure TFillBucketWindow.LoadTempBucketWaterImage(BucketIndex: Integer; ImageControl: TImage);
var
  ImagePath: string;
begin
  if TempWaterIndex[BucketIndex] = 0 then
    ImagePath := BucketEmptyImages[Buckets[BucketIndex].ColorIndex]
  else
    ImagePath := BucketFilledImages[Buckets[BucketIndex].ColorIndex];
  ImageControl.Picture.LoadFromFile(ImagePath);
end;


procedure TFillBucketWindow.CancelButton(Sender: TObject);
var i: Integer;
begin
  for i := 1 to 10 do
    TempWaterIndex[i] := 0;
  Close;
end;

procedure AddItemsCombWater(ComboBox: TComboBox);
begin
  ComboBox.Text := 'Количество литров';
  ComboBox.ReadOnly := True;
  ComboBox.Items.Add('0 литров');
  ComboBox.Items.Add('1 литр');
  ComboBox.Items.Add('2 литра');
  ComboBox.Items.Add('3 литра');
  ComboBox.Items.Add('4 литра');
  ComboBox.Items.Add('5 литров');
  ComboBox.Items.Add('6 литров');
  ComboBox.Items.Add('7 литров');
  ComboBox.Items.Add('8 литров');
  ComboBox.Items.Add('9 литров');
end;

procedure AddItemsAll(ComboBox: TComboBox);
begin
  ComboBox.Text := 'Выберите кол.-во';
  ComboBox.ReadOnly := True;
  ComboBox.Items.Add('0 литров');
  ComboBox.Items.Add('1 литру');
  ComboBox.Items.Add('2 литра');
  ComboBox.Items.Add('3 литра');
  ComboBox.Items.Add('4 литра');
  ComboBox.Items.Add('5 литров');
  ComboBox.Items.Add('6 литров');
  ComboBox.Items.Add('7 литров');
  ComboBox.Items.Add('8 литров');
  ComboBox.Items.Add('9 литров');
end;


procedure TFillBucketWindow.CreateForm3(Sender: TObject);
var
  i: Integer;
begin

  ComboBoxesSetWaterr[1] := ComboBox1;
  ComboBoxesSetWaterr[2] := ComboBox2;
  ComboBoxesSetWaterr[3] := ComboBox3;
  ComboBoxesSetWaterr[4] := ComboBox4;
  ComboBoxesSetWaterr[5] := ComboBox5;
  ComboBoxesSetWaterr[6] := ComboBox6;
  ComboBoxesSetWaterr[7] := ComboBox7;
  ComboBoxesSetWaterr[8] := ComboBox8;
  ComboBoxesSetWaterr[9] := ComboBox9;
  ComboBoxesSetWaterr[10] := ComboBox10;


  for i := 1 to 10 do
  begin
    AddItemsCombWater(ComboBoxesSetWaterr[i]);

    // текущий цвет ведра из Buckets
    ComboBoxesSetWaterr[i].ItemIndex := Buckets[i].WaterLevel;
    TempWaterIndex[i] := Buckets[i].WaterLevel;
  end;

  AddItemsAll(ComboBox11);


  LoadBucketImage3(1, Image1);
  LoadBucketImage3(2, Image2);
  LoadBucketImage3(3, Image3);
  LoadBucketImage3(4, Image4);
  LoadBucketImage3(5, Image5);
  LoadBucketImage3(6, Image6);
  LoadBucketImage3(7, Image7);
  LoadBucketImage3(8, Image8);
  LoadBucketImage3(9, Image9);
  LoadBucketImage3(10, Image10);
end;

procedure TFillBucketWindow.DefaultWater(Sender: TObject);
var
  i: Integer;
begin
  // возврат к начальному DefaultBuckets
  for i := 1 to 10 do
  begin
    Buckets[i].WaterLevel := DefaultBuckets[i].WaterLevel;
    ComboBoxesSetWaterr[i].ItemIndex := DefaultBuckets[i].WaterLevel;
    TempWaterIndex[i] := DefaultBuckets[i].WaterLevel;
  end;

  LoadBucketImage3(1, Image1);
  LoadBucketImage3(2, Image2);
  LoadBucketImage3(3, Image3);
  LoadBucketImage3(4, Image4);
  LoadBucketImage3(5, Image5);
  LoadBucketImage3(6, Image6);
  LoadBucketImage3(7, Image7);
  LoadBucketImage3(8, Image8);
  LoadBucketImage3(9, Image9);
  LoadBucketImage3(10, Image10);
end;

procedure TFillBucketWindow.InAllWater(Sender: TObject);
var
  i, SelectedWaterLevel: Integer;
begin
  SelectedWaterLevel := ComboBox11.ItemIndex;

  for i := 1 to 10 do
  begin
    TempWaterIndex[i] := SelectedWaterLevel;
    ComboBoxesSetWaterr[i].ItemIndex := SelectedWaterLevel;
    LoadTempBucketWaterImage(i, FindComponent('Image' + IntToStr(i)) as TImage);
  end;
end;


procedure TFillBucketWindow.WaterBox1(Sender: TObject);
begin
  TempWaterIndex[1] := ComboBox1.ItemIndex;

  // Обновляем отображение ведра с новым цветом
  LoadTempBucketWaterImage(1, Image1);
end;

procedure TFillBucketWindow.WaterBox2(Sender: TObject);
begin
  TempWaterIndex[2] := ComboBox2.ItemIndex;
  LoadTempBucketWaterImage(2, Image2);
end;

procedure TFillBucketWindow.WaterBox3(Sender: TObject);
begin
  TempWaterIndex[3] := ComboBox3.ItemIndex;
  LoadTempBucketWaterImage(3, Image3);
end;

procedure TFillBucketWindow.WaterBox4(Sender: TObject);
begin
  TempWaterIndex[4] := ComboBox4.ItemIndex;
  LoadTempBucketWaterImage(4, Image4);
end;

procedure TFillBucketWindow.WaterBox5(Sender: TObject);
begin
  TempWaterIndex[5] := ComboBox5.ItemIndex;
  LoadTempBucketWaterImage(5, Image5);
end;

procedure TFillBucketWindow.WaterBox6(Sender: TObject);
begin
  TempWaterIndex[6] := ComboBox6.ItemIndex;
  LoadTempBucketWaterImage(6, Image6);
end;

procedure TFillBucketWindow.WaterBox7(Sender: TObject);
begin
  TempWaterIndex[7] := ComboBox7.ItemIndex;
  LoadTempBucketWaterImage(7, Image7);
end;

procedure TFillBucketWindow.WaterBox8(Sender: TObject);
begin
  TempWaterIndex[8] := ComboBox8.ItemIndex;
  LoadTempBucketWaterImage(8, Image8);
end;

procedure TFillBucketWindow.WaterBox9(Sender: TObject);
begin
  TempWaterIndex[9] := ComboBox9.ItemIndex;
  LoadTempBucketWaterImage(9, Image9);
end;

procedure TFillBucketWindow.WaterBox10(Sender: TObject);
begin
  TempWaterIndex[10] := ComboBox10.ItemIndex;
  LoadTempBucketWaterImage(10, Image10);
end;

procedure TFillBucketWindow.AutoGenWater(Sender: TObject);
var
  i, RandomWaterLevel: Integer;
begin
  for i := 1 to 10 do
  begin
    RandomWaterLevel := Random(10);
    TempWaterIndex[i] := RandomWaterLevel;
    ComboBoxesSetWaterr[i].ItemIndex := TempWaterIndex[i];
    LoadTempBucketWaterImage(i, FindComponent('Image' + IntToStr(i)) as TImage);
  end;
end;


procedure TFillBucketWindow.ApplyWaterButton(Sender: TObject);
var
  i: Integer;
begin
  // Применение временных уровней воды к основному массиву Buckets
  for i := 1 to 10 do
    Buckets[i].WaterLevel := TempWaterIndex[i];
  Form1.UpdateBucketImages;
  Form1.WaterLevelLabels;
  Close;
end;

end.


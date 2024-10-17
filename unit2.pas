unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Menus;

type

  { TCollorBucketWindows }

  TCollorBucketWindows = class(TForm)
    Button1: TButton;
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
    Timer1: TTimer;
    procedure ApplyColorsAp(Sender: TObject);
    procedure CancelColorCh(Sender: TObject);
    procedure AutoGenColorr(Sender: TObject);
    procedure DefaultColorSett(Sender: TObject);
    procedure Form2Create(Sender: TObject);
    procedure SelectColorBox1(Sender: TObject);
    procedure LoadTempBucketImage(BucketIndex: Integer; ImageControl: TImage);
    procedure SelectColorBox10(Sender: TObject);
    procedure SelectColorBox2(Sender: TObject);
    procedure SelectColorBox3(Sender: TObject);
    procedure SelectColorBox4(Sender: TObject);
    procedure SelectColorBox5(Sender: TObject);
    procedure SelectColorBox6(Sender: TObject);
    procedure SelectColorBox7(Sender: TObject);
    procedure SelectColorBox8(Sender: TObject);
    procedure SelectColorBox9(Sender: TObject);
  private

  public

  end;

var
  CollorBucketWindows: TCollorBucketWindows;
  FlagCheck: Boolean;
  TempColorIndex: array[1..10] of Integer;
  ComboBoxesSetColorr: array[1..10] of TComboBox;

implementation

{$R *.lfm}

{ TCollorBucketWindows }

uses Unit1;


procedure LoadBucketImage2(BucketIndex: Integer; ImageControl: TImage);
var
  ImagePath: string;
begin
  if Buckets[BucketIndex].WaterLevel = 0 then
    ImagePath := BucketEmptyImages[Buckets[BucketIndex].ColorIndex]
  else
    ImagePath := BucketFilledImages[Buckets[BucketIndex].ColorIndex];

  ImageControl.Picture.LoadFromFile(ImagePath);
end;


procedure TCollorBucketWindows.LoadTempBucketImage(BucketIndex: Integer; ImageControl: TImage);
var
  ImagePath: string;
begin
  if Buckets[BucketIndex].WaterLevel = 0 then
    ImagePath := BucketEmptyImages[TempColorIndex[BucketIndex]]
  else
    ImagePath := BucketFilledImages[TempColorIndex[BucketIndex]];
  ImageControl.Picture.LoadFromFile(ImagePath);
end;

procedure TCollorBucketWindows.SelectColorBox1(Sender: TObject);
begin
  // Когда меняется выбранный цвет в ComboBox, обновляем временную переменную
  TempColorIndex[1] := ComboBox1.ItemIndex+1;

  LoadTempBucketImage(1, Image1);
end;


procedure TCollorBucketWindows.SelectColorBox2(Sender: TObject);
begin
  TempColorIndex[2] := ComboBox2.ItemIndex+1;

  LoadTempBucketImage(2, Image2);
end;

procedure TCollorBucketWindows.SelectColorBox3(Sender: TObject);
begin
  TempColorIndex[3] := ComboBox3.ItemIndex+1;

  LoadTempBucketImage(3, Image3);
end;

procedure TCollorBucketWindows.SelectColorBox4(Sender: TObject);
begin
  TempColorIndex[4] := ComboBox4.ItemIndex + 1;
  LoadTempBucketImage(4, Image4);
end;

procedure TCollorBucketWindows.SelectColorBox5(Sender: TObject);
begin
   TempColorIndex[5] := ComboBox5.ItemIndex + 1;
   LoadTempBucketImage(5, Image5);
end;

procedure TCollorBucketWindows.SelectColorBox6(Sender: TObject);
begin
  TempColorIndex[6] := ComboBox6.ItemIndex + 1;
  LoadTempBucketImage(6, Image6);
end;

procedure TCollorBucketWindows.SelectColorBox7(Sender: TObject);
begin
   TempColorIndex[7] := ComboBox7.ItemIndex + 1;
   LoadTempBucketImage(7, Image7);;
end;

procedure TCollorBucketWindows.SelectColorBox8(Sender: TObject);
begin
   TempColorIndex[8] := ComboBox8.ItemIndex + 1;
   LoadTempBucketImage(8, Image8);
end;

procedure TCollorBucketWindows.SelectColorBox9(Sender: TObject);
begin
    TempColorIndex[9] := ComboBox9.ItemIndex + 1;
    LoadTempBucketImage(9, Image9);;
end;

procedure TCollorBucketWindows.SelectColorBox10(Sender: TObject);
begin
  TempColorIndex[10] := ComboBox10.ItemIndex + 1;
  LoadTempBucketImage(10, Image10);
end;




procedure AddItemsComb(ComboBox: TComboBox);
begin
  ComboBox.Text := 'Выберите цвет...';
  ComboBox.ReadOnly := True;
  ComboBox.Items.Add('Черный');
  ComboBox.Items.Add('Синий');
  ComboBox.Items.Add('Бирюзовый');
  ComboBox.Items.Add('Темно-красный');
  ComboBox.Items.Add('Темно-желтый');
  ComboBox.Items.Add('Зеленый');
  ComboBox.Items.Add('Серый');
  ComboBox.Items.Add('Голубой');
  ComboBox.Items.Add('Коричневый');
  ComboBox.Items.Add('Розовый');
  ComboBox.Items.Add('Светло-фиолетовый');
  ComboBox.Items.Add('Светло-зеленый');
  ComboBox.Items.Add('Ультрамариновый');
  ComboBox.Items.Add('Фиолетовый');
  ComboBox.Items.Add('Красный');
  ComboBox.Items.Add('Желтый');
end;

procedure TCollorBucketWindows.Form2Create(Sender: TObject);
var
  kkk: Integer;
begin
  ComboBoxesSetColorr[1] := ComboBox1;
  ComboBoxesSetColorr[2] := ComboBox2;
  ComboBoxesSetColorr[3] := ComboBox3;
  ComboBoxesSetColorr[4] := ComboBox4;
  ComboBoxesSetColorr[5] := ComboBox5;
  ComboBoxesSetColorr[6] := ComboBox6;
  ComboBoxesSetColorr[7] := ComboBox7;
  ComboBoxesSetColorr[8] := ComboBox8;
  ComboBoxesSetColorr[9] := ComboBox9;
  ComboBoxesSetColorr[10] := ComboBox10;

  for kkk := 1 to 10 do
  begin
    AddItemsComb(ComboBoxesSetColorr[kkk]);

    // Ставим в ComboBox текущий цвет ведра (ColorIndex из Buckets)
    ComboBoxesSetColorr[kkk].ItemIndex := Buckets[kkk].ColorIndex - 1;

    TempColorIndex[kkk] := Buckets[kkk].ColorIndex;
  end;

  LoadBucketImage2(1, Image1);
  LoadBucketImage2(2, Image2);
  LoadBucketImage2(3, Image3);
  LoadBucketImage2(4, Image4);
  LoadBucketImage2(5, Image5);
  LoadBucketImage2(6, Image6);
  LoadBucketImage2(7, Image7);
  LoadBucketImage2(8, Image8);
  LoadBucketImage2(9, Image9);
  LoadBucketImage2(10, Image10);
end;

procedure TCollorBucketWindows.CancelColorCh(Sender: TObject);
var ii: Integer;
begin
  for ii := 1 to 10 do
    TempColorIndex[ii] := 0;
  Close;
end;

procedure TCollorBucketWindows.AutoGenColorr(Sender: TObject);
var
  AvailableColors: array of Integer;
  RandomIndex, i: Integer;
begin
  // Создаем массив доступных индексов цветов (1..16)
  SetLength(AvailableColors, 16);
  for i := 1 to 16 do
    AvailableColors[i - 1] := i;

  // Перебираем ведра и назначаем каждому случайный уникальный цвет
  for i := 1 to 10 do
  begin
    RandomIndex := Random(Length(AvailableColors));

    TempColorIndex[i] := AvailableColors[RandomIndex];

    // Удаляем использованный цвет из массива доступных цветов
    AvailableColors[RandomIndex] := AvailableColors[High(AvailableColors)];
    SetLength(AvailableColors, Length(AvailableColors) - 1);

    // Обновляем выбранный элемент в ComboBox и ведро
    case i of
      1: ComboBox1.ItemIndex := TempColorIndex[1] - 1;
      2: ComboBox2.ItemIndex := TempColorIndex[2] - 1;
      3: ComboBox3.ItemIndex := TempColorIndex[3] - 1;
      4: ComboBox4.ItemIndex := TempColorIndex[4] - 1;
      5: ComboBox5.ItemIndex := TempColorIndex[5] - 1;
      6: ComboBox6.ItemIndex := TempColorIndex[6] - 1;
      7: ComboBox7.ItemIndex := TempColorIndex[7] - 1;
      8: ComboBox8.ItemIndex := TempColorIndex[8] - 1;
      9: ComboBox9.ItemIndex := TempColorIndex[9] - 1;
      10: ComboBox10.ItemIndex := TempColorIndex[10] - 1;
    end;

    LoadTempBucketImage(i, FindComponent('Image' + IntToStr(i)) as TImage);
  end;
end;

procedure TCollorBucketWindows.DefaultColorSett(Sender: TObject);
var
  ii: Integer;
begin
  for ii := 1 to 10 do
  begin
    Buckets[ii].ColorIndex := DefaultBuckets[ii].ColorIndex;
    ComboBoxesSetColorr[ii].ItemIndex := DefaultBuckets[ii].ColorIndex - 1;
    TempColorIndex[ii] := DefaultBuckets[ii].ColorIndex;
  end;

  LoadBucketImage2(1, Image1);
  LoadBucketImage2(2, Image2);
  LoadBucketImage2(3, Image3);
  LoadBucketImage2(4, Image4);
  LoadBucketImage2(5, Image5);
  LoadBucketImage2(6, Image6);
  LoadBucketImage2(7, Image7);
  LoadBucketImage2(8, Image8);
  LoadBucketImage2(9, Image9);
  LoadBucketImage2(10, Image10);
end;


function AreColorsUnique(ColorIndices: array of Integer): Boolean;
var
  i, j: Integer;
begin
  Result := True; // Предполагаем, что цвета уникальны
  for i := Low(ColorIndices) to High(ColorIndices) do
  begin
    for j := i + 1 to High(ColorIndices) do
    begin
      if ColorIndices[i] = ColorIndices[j] then
      begin
        Result := False; // Найден дубликат
        Exit;
      end;
    end;
  end;
end;

procedure TCollorBucketWindows.ApplyColorsAp(Sender: TObject);
var i: Integer;
begin
  if AreColorsUnique(TempColorIndex) then
  begin
    // Применяем временные индексы цвета к основным ведрам
    for i := 1 to 10 do
      Buckets[i].ColorIndex := TempColorIndex[i];
    Form1.UpdateBucketImages;  // обновление изображения на первой форме
    Close;
  end
  else
  begin
    MessageDlg('Ошибка', 'Имеются повторяющиеся цвета! Цвета вёдер должны быть уникальными.', mtError, [mbOK], 0);
  end;
end;

end.


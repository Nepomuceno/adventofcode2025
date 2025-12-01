with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Input_Reader; use Input_Reader;

package body Day_01 is

   procedure Part_1 (Input : String) is
      Lines  : constant String_Array_Access := Read_File (Input);
      Line   : Unbounded_String;
      Dir    : Character;
      Num    : Integer;
      Result : Integer;
      Number_of_Zeros : Integer;
   begin
      Put_Line ("Day 01 - Part 1");
      Result := 50;
      Number_of_Zeros := 0;
      if Lines /= null then
         for I in Lines'Range loop
            Line := Lines (I);
            Dir := Element (Line, 1);
            Num := Integer'Value (Slice (Line, 2, Length (Line)));
            if Dir = 'L' then
               Result := Result - Num;
            else
               Result := Result + Num;
            end if;
            while Result >= 100 loop
               Result := Result - 100;
            end loop;
            while Result < 0 loop
               Result := Result + 100;
            end loop;
            if Result = 0 then
               Number_of_Zeros := Number_of_Zeros + 1;
            end if;
            Put_Line ("Result: " & Integer'Image (Result));
         end loop;
      end if;
      Put_Line ("Number of Zeros: " & Integer'Image (Number_of_Zeros));
   end Part_1;

   procedure Part_2 (Input : String) is
      Lines  : constant String_Array_Access := Read_File (Input);
      Line   : Unbounded_String;
      Dir    : Character;
      Num    : Integer;
      Position : Integer;
      Number_of_Zeros : Integer;
   begin
      Put_Line ("Day 01 - Part 2");
      Position := 50;
      Number_of_Zeros := 0;
      if Lines /= null then
         for I in Lines'Range loop
            Line := Lines (I);
            Dir := Element (Line, 1);
            Num := Integer'Value (Slice (Line, 2, Length (Line)));
            Put_Line ("Dir: " & Dir & "  Number: " & Integer'Image (Num));
            for J in 1 .. Num loop
               if Dir = 'L' then
                  Position := Position - 1;
                  Put_Line ("Moving Left " & Integer'Image (J) &
                  " Position: " & Integer'Image (Position));
               else
                  Position := Position + 1;
                  Put_Line ("Moving Right" & Integer'Image (J) &
                  " Position: " & Integer'Image (Position));
               end if;
               if Position = 100 then
                  Position := 0;
               end if;
               if Position = -1 then
                  Position := 99;
               end if;
               if Position = 0 then
                  Put_Line ("[ADDED] Zero registered");
                  Number_of_Zeros := Number_of_Zeros + 1;
               end if;
            end loop;
            Put_Line ("Result: " & Integer'Image (Position));
         end loop;
      end if;
      Put_Line ("Number of Zeros: " & Integer'Image (Number_of_Zeros));
   end Part_2;

end Day_01;

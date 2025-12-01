with Ada.Text_IO;            use Ada.Text_IO;
with Ada.Command_Line;       use Ada.Command_Line;
with Input_Reader;           use Input_Reader;
with Day_01;
with Day_02;
with Day_03;
with Day_04;
with Day_05;
with Day_06;
with Day_07;
with Day_08;
with Day_09;
with Day_10;
with Day_11;
with Day_12;

procedure Adventofcode2025 is

   procedure Print_Usage is
   begin
      Put_Line ("Advent of Code 2025 - Ada Solutions");
      Put_Line ("");
      Put_Line ("Usage: adventofcode2025 <day> [part] [--example]");
      Put_Line ("");
      Put_Line ("  day      : Day number (1-12)");
      Put_Line ("  part     : Part number (1 or 2, default: both)");
      Put_Line ("  --example: Use example input file instead of real input");
      Put_Line ("");
      Put_Line ("Examples:");
      Put_Line ("  adventofcode2025 1           # Run day 1, both parts");
      Put_Line ("  adventofcode2025 1 2         # Run day 1, part 2 only");
      Put_Line ("  adventofcode2025 1 --example # Run day 1 with example");
   end Print_Usage;

   procedure Run_Day (Day : Positive; Part : Natural; Input_Path : String) is
   begin
      case Day is
         when 1 =>
            if Part = 0 or else Part = 1 then
               Day_01.Part_1 (Input_Path);
            end if;
            if Part = 0 or else Part = 2 then
               Day_01.Part_2 (Input_Path);
            end if;
         when 2 =>
            if Part = 0 or else Part = 1 then
               Day_02.Part_1 (Input_Path);
            end if;
            if Part = 0 or else Part = 2 then
               Day_02.Part_2 (Input_Path);
            end if;
         when 3 =>
            if Part = 0 or else Part = 1 then
               Day_03.Part_1 (Input_Path);
            end if;
            if Part = 0 or else Part = 2 then
               Day_03.Part_2 (Input_Path);
            end if;
         when 4 =>
            if Part = 0 or else Part = 1 then
               Day_04.Part_1 (Input_Path);
            end if;
            if Part = 0 or else Part = 2 then
               Day_04.Part_2 (Input_Path);
            end if;
         when 5 =>
            if Part = 0 or else Part = 1 then
               Day_05.Part_1 (Input_Path);
            end if;
            if Part = 0 or else Part = 2 then
               Day_05.Part_2 (Input_Path);
            end if;
         when 6 =>
            if Part = 0 or else Part = 1 then
               Day_06.Part_1 (Input_Path);
            end if;
            if Part = 0 or else Part = 2 then
               Day_06.Part_2 (Input_Path);
            end if;
         when 7 =>
            if Part = 0 or else Part = 1 then
               Day_07.Part_1 (Input_Path);
            end if;
            if Part = 0 or else Part = 2 then
               Day_07.Part_2 (Input_Path);
            end if;
         when 8 =>
            if Part = 0 or else Part = 1 then
               Day_08.Part_1 (Input_Path);
            end if;
            if Part = 0 or else Part = 2 then
               Day_08.Part_2 (Input_Path);
            end if;
         when 9 =>
            if Part = 0 or else Part = 1 then
               Day_09.Part_1 (Input_Path);
            end if;
            if Part = 0 or else Part = 2 then
               Day_09.Part_2 (Input_Path);
            end if;
         when 10 =>
            if Part = 0 or else Part = 1 then
               Day_10.Part_1 (Input_Path);
            end if;
            if Part = 0 or else Part = 2 then
               Day_10.Part_2 (Input_Path);
            end if;
         when 11 =>
            if Part = 0 or else Part = 1 then
               Day_11.Part_1 (Input_Path);
            end if;
            if Part = 0 or else Part = 2 then
               Day_11.Part_2 (Input_Path);
            end if;
         when 12 =>
            if Part = 0 or else Part = 1 then
               Day_12.Part_1 (Input_Path);
            end if;
            if Part = 0 or else Part = 2 then
               Day_12.Part_2 (Input_Path);
            end if;
         when others =>
            Put_Line ("Day" & Positive'Image (Day) & " not implemented");
      end case;
   end Run_Day;

   Day         : Positive;
   Part        : Natural := 0;
   Use_Example : Boolean := False;

begin
   if Argument_Count = 0 then
      Print_Usage;
      return;
   end if;

   begin
      Day := Positive'Value (Argument (1));
      if Day > 12 then
         Put_Line ("Error: Day must be between 1 and 12");
         return;
      end if;
   exception
      when others =>
         Put_Line ("Error: Invalid day number");
         Print_Usage;
         return;
   end;

   for I in 2 .. Argument_Count loop
      if Argument (I) = "--example" or else Argument (I) = "-e" then
         Use_Example := True;
      else
         begin
            Part := Natural'Value (Argument (I));
            if Part > 2 then
               Put_Line ("Error: Part must be 1 or 2");
               return;
            end if;
         exception
            when others =>
               Put_Line ("Error: Invalid argument: " & Argument (I));
               return;
         end;
      end if;
   end loop;

   Run_Day (Day, Part, Get_Input_Path (Day, Use_Example));

end Adventofcode2025;

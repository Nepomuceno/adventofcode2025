with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Containers.Vectors;

package body Input_Reader is

   package String_Vectors is new Ada.Containers.Vectors
     (Index_Type => Positive, Element_Type => Unbounded_String);

   function Read_File (Filename : String) return String_Array_Access is
      File   : File_Type;
      Lines  : String_Vectors.Vector;
      Result : String_Array_Access;
   begin
      Open (File, In_File, Filename);
      while not End_Of_File (File) loop
         Lines.Append (To_Unbounded_String (Get_Line (File)));
      end loop;
      Close (File);

      Result := new String_Array (1 .. Positive (Lines.Length));
      for I in Result'Range loop
         Result (I) := Lines (I);
      end loop;
      return Result;
   exception
      when Name_Error =>
         Put_Line ("Error: File not found - " & Filename);
         return null;
   end Read_File;

   function Get_Input_Path
     (Day : Positive; Example : Boolean := False) return String
   is
      Day_Img : constant String := Positive'Image (Day);
      Day_Str : constant String :=
        (if Day < 10 then "0" else "") & Day_Img (2 .. Day_Img'Last);
      Suffix  : constant String := (if Example then "_example" else "");
   begin
      return "inputs/day_" & Day_Str & Suffix & ".txt";
   end Get_Input_Path;

end Input_Reader;

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Input_Reader is

   type String_Array is array (Positive range <>) of Unbounded_String;
   type String_Array_Access is access String_Array;

   function Read_File (Filename : String) return String_Array_Access;
   function Get_Input_Path
     (Day : Positive; Example : Boolean := False) return String;

end Input_Reader;

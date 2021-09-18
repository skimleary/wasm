//
// lua.cs -- Embedded Lua Test
//
using System;
using MoonSharp.Interpreter;

class Program
{
    static double MoonSharpFactorial(int num)
    {
		string scriptCode = @"    
			-- defines a factorial function
			function fact(n)
				if (n == 0) then
					return 1
				else
					return n*fact(n-1)
				end
			end

			return fact(fnum)";

		var script = new Script();

		script.Globals["fnum"] = num;

		DynValue res = script.DoString(scriptCode);

		return res.Number;
	}

	static void Main()
	{
		Console.WriteLine("fact(6) = {0}", MoonSharpFactorial(6));
	}
}

// lua.cs
// vim: set ts=4 sw=4:

PROGRAM
// globalScope [ class_io ]
class human { // pass [ class_io ]
}
// globalScope [class_io, class_human ]
class animal { // pass [class_io, class_human]
	// classScope []
	int a; // pass []
	// classScope [ a ]
	int b; // pass [ a ]
	// classScope [ a, b ]
	int foo // pass [ a, b ]
		// methodScope []
	(int c, int d) 
		// methodScope [ c, d ]
    // combine [ c, d, a, b, ]
	{ // pass [ c, d, a, b, ]
    // blockScope [  ]
    int e;
    // blockScope [ e ]
    int f;
    // blockScope [ e, f ]
    // combine [ e, f, c, d, a, b]
    for // pass [ e, f, c, d, a, b]
      // blockScope1 []
     (int i, )
      // blockScope1 [ i ]
      // combine [ i, e, f, c, d, a, b]
    { // pass [ i, e, f, c, d, a, b]
      ...
    }
    ...
    stmts
    ...
	}
	// classScope [ a, b, foo ]
  int foo1 // pass [ a, b, foo ]
}



foo
// methodScope []
(a, b, c)
// methodScope [a, b, c]
{ // pass [a, b, c]
	int d;
	int e;
	// methodScope [a, b, c, d, e]
	for // [a, b, c, d, e]
		// blockScope1 []
		(int i ; .. ; )
		// blockScope1 [i]
		{ 
		// blockScope1 [ i ]
		int f;
		int g;
		// blockScope1 [ i, f, g ]
		// combine [i, f, g, a, b, c, d, e]

		excute command 

		for (int j , ,) { // [i, f, g, a, b, c, d, e]
				 // block1Scope2 [ j ]
				 int k
				 // block1Scope2 [ j, k ]
		}
	}
}

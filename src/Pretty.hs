module Pretty where
 import Type
 class Pretty a where
   pretty:: a -> String

 instance (Pretty Term) where
  pretty (Var x )                   = 'A':show(x)
  pretty (Comb "." (x:(Var xs:[]))) = "[ "++(pretty x)++"| "++(pretty (Var xs))++" ]"
  pretty (Comb "." (x:[]))          = "[ "++(pretty x)++" ]"
  pretty (Comb "." (x:xs))          = "[ "++(pretty x)++", "++(pretty xs) ++" ]"
  pretty (Comb y [] )               = y
  pretty (Comb y (x:[]) )           = y++"( "++(pretty x)++" )"
  pretty (Comb y (x:xs) )           = y++"( "++(pretty x)++", "++(pretty xs)++" )"

 instance (Pretty b) => (Pretty [b] ) where
  pretty []      = ""
  pretty [x]     = pretty x
  pretty (x:xs)  = (pretty x )++", "++pretty xs

{-
pretty (Prog w)     = prettyProg w
pretty (Var x)      = prettyTerm (Var x)
pretty (Comb y z)   = prettyTerm (Comb y z)


prettyProg:: [Rule] ->String
prettyProg []        = ""
prettyProg (x : xs)  = (prettyRule x) ++ (prettyNextRules xs)

prettyNextRules:: [Rule] ->String
prettyNextRules []        = ""
prettyNextRules (x : xs)  = ", " ++ (pretty x) ++ (prettyNextRules xs)


prettyRule:: Term -> [Term] ->String
prettyRule a b = "true" --Testweise

prettyTerm:: Term ->String
prettyTerm Var x = prettyIndex x

prettyIndex:: VarIndex ->String
prettyIndex x = show ('A'+x)
-}
||| Functions are perhaps recursive
|||
||| Module    : Funcs.idr
||| Copyright : (c) Jan de Muijnck-Hughes
||| License   : see LICENSE
|||
module Ola.Terms.Funcs

import Data.List.Elem
import Data.Vect

import Ola.Terms.Types
import Ola.Terms.Vars
import Ola.Terms.Exprs
import Ola.Terms.Stmts

%default total

public export
data Func : (roles : List Ty.Role)
         -> (types : List Ty.Base)
         -> (stack : List Ty.Base)
         -> (type  :      Ty.Base)
                  -> Type
  where
    ||| A non-recusrive function.
    ||| We need this setup to ensure that we deal with eearly returns and end of computations.
    ||| We must have a last expression to evaluate in case there are no early returns....
    Fun : {args   : List Ty.Base}
       -> {return : Ty.Base}
       -> (body   : Stmt roles types (args ++ stack) out return)
       -> (ret    : Expr roles types out return)
                 -> Func roles types stack (FUNC args return)

-- [ EOF ]

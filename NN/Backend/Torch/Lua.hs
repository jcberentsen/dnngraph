module NN.Backend.Torch.Lua where

import           Data.Word
import           Language.Lua.Syntax
import qualified Data.Text as T

newtype LS = L String

-- |Handy typeclass for converting arguments
class ToLua a where
    toLua :: a -> Exp

instance ToLua Word32 where
    toLua = Number . T.pack . show

instance ToLua LS where
    toLua (L s') = String (T.pack s')

instance ToLua Float where
    toLua = Number . T.pack . show

instance (ToLua a) => ToLua (Maybe a) where
    toLua Nothing = Nil
    toLua (Just a) = toLua a

-- Helpers for Lua code generation
assign :: Name -> Exp -> Stat
assign lval exp' = LocalAssign [lval] (Just [exp'])

require :: Name -> Stat
require (Name module') = funCall (Name (T.pack "require")) [String module']

funCall :: Name -> [Exp] -> Stat
funCall name' args = FunCall (NormalFunCall (var name') (Args args))

methCall :: Name -> Name -> [Exp] -> Stat
methCall table field args = FunCall (MethodCall (var table) field (Args args))

return' :: Name -> Exp
return' name' = PrefixExp (var name')

var :: Name -> PrefixExp
var name' = PEVar (VarName name')

var' :: Name -> Exp
var' name' = PrefixExp (var name')

import Codec.CBOR.Pretty
import Codec.CBOR.Read
import Codec.CBOR.Term

import qualified Data.ByteString.Lazy as B

main = do
    bytes <- B.getContents
    case deserialiseFromBytes decodeTerm bytes of
        Left msg ->
            print msg
        Right (_, value) ->
            putStrLn (prettyHexEnc (encodeTerm value))

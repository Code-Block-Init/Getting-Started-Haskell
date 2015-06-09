{-headers-}
import Data.Bits

{-declarations-}
max_bits_unsigned n = 2^n - 1
max_bits_signed n = 2^(n-1)
min_bits_signed n = 1 - 2^(n-1)

{-getting n bytes-}
get_n_byte number n_byte = (number `shiftR` (n_byte*8)) .&. 225

{-splitting n bytes-}
split_n_byte number n_bytes = map(get_n_byte number) [0..n_bytes]

{-array of bytes-}
bytes_to_num byte_array = foldr(\a b -> a + (shiftL b 8)) 0 byte_array

{-number of bytes-}
num_to_bytes number = bytes ++ [get_n_byte number (length bytes)]

{--oh yeah..-}
num_to_bytes number = bytes ++ [get_n_byte number(length bytes)]
	where
		bytes = last $ takeWhile (\n -> bytes_to_num n < number) $ bytes_sequences
		bytes_sequences = map(\n -> take n (byte_stream number)) [0..]
		byte_stream number = map(get_n_byte number) [0..]

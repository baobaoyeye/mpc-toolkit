package utils

import (
	"encoding/binary"
	"encoding/hex"
	"fmt"
)

type Block struct {
	Hi, Lo uint64
}

func (u Block)GetLSB() bool {
	return (u.Lo & 1) == 1 // 拿到最右一位的值 0 or 1
}

// GetBytes returns a big-endian byte representation.
func (u Block) GetBytes() []byte {
	buf := make([]byte, 16)
	binary.BigEndian.PutUint64(buf[:8], u.Hi)
	binary.BigEndian.PutUint64(buf[8:], u.Lo)
	return buf
}

// String returns a hexadecimal string representation.
func (u Block) String() string {
	return hex.EncodeToString(u.GetBytes())
}

// Equal returns whether or not the Block are equivalent.
func (u Block) Equal(o Block) bool {
	return u.Hi == o.Hi && u.Lo == o.Lo
}

// Compare compares the two Block.
func (u Block) Compare(o Block) int {
	if u.Hi > o.Hi {
		return 1
	} else if u.Hi < o.Hi {
		return -1
	} else if u.Lo > o.Lo {
		return 1
	} else if u.Lo < o.Lo {
		return -1
	}
	return 0
}

// Add returns a new Block incremented by n.
func (u Block) Add(n uint64) Block {
	lo := u.Lo + n
	hi := u.Hi
	if u.Lo > lo {
		hi++
	}
	return Block{hi, lo}
}

// Sub returns a new Block decremented by n.
func (u Block) Sub(n uint64) Block {
	lo := u.Lo - n
	hi := u.Hi
	if u.Lo < lo {
		hi--
	}
	return Block{hi, lo}
}

// And returns a new Block that is the bitwise AND of two Block values.
func (u Block) And(o Block) Block {
	return Block{u.Hi & o.Hi, u.Lo & o.Lo}
}

// Or returns a new Block that is the bitwise OR of two Block values.
func (u Block) Or(o Block) Block {
	return Block{u.Hi | o.Hi, u.Lo | o.Lo}
}

// Xor returns a new Block that is the bitwise XOR of two Block values.
func (u Block) Xor(o Block) Block {
	return Block{u.Hi ^ o.Hi, u.Lo ^ o.Lo}
}

// FromBytes parses the byte slice as a 128 bit big-endian unsigned integer.
// The caller is responsible for ensuring the byte slice contains 16 bytes.
func FromBytes(b []byte) Block {
	hi := binary.BigEndian.Uint64(b[:8])
	lo := binary.BigEndian.Uint64(b[8:])
	return Block{hi, lo}
}

// FromString parses a hexadecimal string as a 128-bit big-endian unsigned integer.
func FromString(s string) (Block, error) {
	if len(s) > 32 {
		return Block{}, fmt.Errorf("input string %s too large for Block", s)
	}
	bytes, err := hex.DecodeString(s)
	if err != nil {
		return Block{}, fmt.Errorf("%s could not decode %s as hex", err.Error(), s)
	}

	// Grow the byte slice if it's smaller than 16 bytes, by prepending 0s
	if len(bytes) < 16 {
		bytesCopy := make([]byte, 16)
		copy(bytesCopy[(16-len(bytes)):], bytes)
		bytes = bytesCopy
	}

	return FromBytes(bytes), nil
}

// FromInts takes in two unsigned 64-bit integers and constructs a Block.
func FromInts(hi uint64, lo uint64) Block {
	return Block{hi, lo}
}

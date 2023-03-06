package util

import (
	"math/rand"
	"strings"
	"time"
)

const alphabet = "abcdefghijklmnopqrstuvwxyz"

func init() {
	rand.Seed(time.Now().UnixNano())
}

// RandomInt generating a random integer between min and max
func RandomInt(min, max int64) int64 {

	return min + rand.Int63n(max-min+1) // random number between o --> (max - min)
}

// RandomString generating a random string of length n
func RandomString(n int) string {
	var sb strings.Builder
	k := len(alphabet)
	for i := 0; i < n; i++ {
		c := alphabet[rand.Intn(k)]
		sb.WriteByte(c)
	}

	return sb.String()
}

// RandomOwner generate random owner name
func RandomOwner() string {
	return RandomString(6)
}

// RandomBalance generate random owner balance
func RandomBalance() int64 {
	return RandomInt(0, 1000)
}

// RandomCurrency generate random currency code
func RandomCurrency() string {
	currencies := []string{"EUR", "USD", "CAD"}
	n := len(currencies)
	return currencies[rand.Intn(n-1)]
}

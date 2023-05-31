package util

//constants for all currencies
const (
	USD = "USD"
	EUR = "EUR"
	CAD = "CAD"
)

func IsSupportedCurrency(currency string) bool {
	switch currency {
	case USD, CAD, EUR:
		return true
	}
	return false
}

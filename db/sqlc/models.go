// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.17.2

package db

import (
	"time"
)

type Accounts struct {
	ID        int64     `json:"id"`
	Owner     string    `json:"owner"`
	Balance   int64     `json:"balance"`
	Currency  string    `json:"currency"`
	CreatedAt time.Time `json:"createdAt"`
}

type Entries struct {
	ID        int64 `json:"id"`
	AccountID int64 `json:"accountID"`
	// can be negative
	Amount    int64     `json:"amount"`
	CreatedAt time.Time `json:"createdAt"`
}

type Transfers struct {
	ID            int64 `json:"id"`
	FromAccountID int64 `json:"fromAccountID"`
	ToAccountID   int64 `json:"toAccountID"`
	// must be positive
	Amount    int64     `json:"amount"`
	CreatedAt time.Time `json:"createdAt"`
}

type Users struct {
	Username         string    `json:"username"`
	HashedPassword   string    `json:"hashedPassword"`
	FullName         string    `json:"fullName"`
	Email            string    `json:"email"`
	PasswordChangeAt time.Time `json:"passwordChangeAt"`
	CreatedAt        time.Time `json:"createdAt"`
}

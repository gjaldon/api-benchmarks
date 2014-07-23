package main

import (
	"fmt"
	"os"

	"github.com/gin-gonic/gin"
	"labix.org/v2/mgo"
	"labix.org/v2/mgo/bson"
)

type User struct {
	Username string
}

func main() {
	session, err := mgo.Dial("localhost")
	if err != nil {
		fmt.Printf("Can't connect to mongo, go error %v\n", err)
		os.Exit(1)
	}
	defer session.Close()

	session.SetSafe(&mgo.Safe{})

	db := session.DB("quipper_web_development")

	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		var user User
		err = db.C("users").Find(bson.M{"username": "student1"}).One(&user)
		if err != nil {
			fmt.Printf("got an error finding a doc %v\n")
			c.JSON(404, gin.H{"error": "Not Found"})
		} else {
			c.JSON(200, user)
		}
	})

	fmt.Printf("server is running on 3000")
	r.Run(":3000")
}

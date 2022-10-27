import React from 'react'
import { Box, Button, TextField } from "@mui/material";
import { Formik } from "formik";
import { useMediaQuery } from '@mui/material'
import Header from './Header';
import { useState } from 'react'
import {useNavigate } from 'react-router-dom';

export default function Login() {

  const isNonMobile = useMediaQuery("(min-width:600px)")
  const [user, setUser] = useState({ name: "" })
  const nav = useNavigate()

  const initialValues = {
    username: "",
    password: "",
    user_email: "",
    confirm_email: ""
  }
  // let formHandleChange = (e) => {
  //     ...initialValues,
  //     [e.target.name]: e.target.value

  // }

  const handleFormSubmit = (values) => {
    console.log(values);
    fetch("http://localhost:3000/login", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(values),
    })
      .then((res) => res.json()) 
        .then((data) => {
          localStorage.setItem("token", data.token);
          setUser({
            name: data.user.username
          });
          nav("/Calendar")
        });
}


  let handleLinkToPasswordReset = (e) => {
    if (e)
      nav("/PasswordReset")
  }

  return (

    <Box m="80px" >
            <Header title="Welcome back, please login!" subtitle="Forgot Password?">
        <button onClick={handleLinkToPasswordReset}></button>
      </Header>
      <Formik
        onSubmit={handleFormSubmit}
        initialValues={initialValues}
      >
        {({
          values,
          handleBlur,
          handleChange,
          handleSubmit,
        }) => (
          <form onSubmit={handleSubmit}>
            <Box
              display="grid"
              gap="30px"
              gridTemplateColumns="repeat(4, minmax(0, 1fr))"
              sx={{
                "& > div": { gridColumn: isNonMobile ? undefined : "span 4" },
              }}
            >
              <TextField
                fullWidth
                variant="filled"
                type="text"
                label="Username"
                onBlur={handleBlur}
                onChange={handleChange}
                value={values.username}
                name="username"
                sx={{ gridColumn: "span 2" }}
              />
              <TextField
                fullWidth
                variant="filled"
                type="password"
                label="Password"
                onBlur={handleBlur}
                onChange={handleChange}
                value={values.password}
                name="password"
                sx={{ gridColumn: "span 2" }}
              />
              <TextField
                fullWidth
                variant="filled"
                type="email"
                label="Email"
                onBlur={handleBlur}
                onChange={handleChange}
                value={values.user_email}
                name="user_email"
                sx={{ gridColumn: "span 2" }}
              />
              <TextField
                fullWidth
                variant="filled"
                type="email"
                label="Confirm Email"
                onBlur={handleBlur}
                onChange={handleChange}
                value={values.confirm_email}
                name="confirm_email"
                sx={{ gridColumn: "span 2" }}
              />
            </Box>
            <Box display="flex" justifyContent="end" mt="20px">
              <Button type="submit" color="secondary" variant="contained">
                Login
              </Button>
            </Box>
          </form>
        )}
      </Formik>

    </Box>

  )
}
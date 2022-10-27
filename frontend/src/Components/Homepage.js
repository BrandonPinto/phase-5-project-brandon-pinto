import React from 'react'
import Login from './Login'
import { Box, Button } from '@mui/material'
import Header from './Header'
import { useNavigate } from 'react-router-dom'
const Homepage = () => {

  let nav = useNavigate()

let navToSignup = (e) => {
  if(e)
  nav("/Signup")
}
  return (

    <div>
      
        <Box m="50px"display="flex" justifyContent="center">
        <Header title="Welcome to Calendar4U" subtitle="New here? Click the Sign Up text!"/>
        </Box>
        <Box m="10px"display="flex" justifyContent="center" onClick={navToSignup}>Sign Up</Box>
        <Login/>
    </div>

  )
}
export default Homepage
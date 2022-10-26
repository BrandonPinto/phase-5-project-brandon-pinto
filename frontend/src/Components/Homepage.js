import React from 'react'
import Login from './Login'
import Signup from './Signup'
import { Box } from '@mui/material'
import Header from './Header'
const Homepage = () => {

  return (

    <div>
        <Box m="50px"display="flex" justifyContent="center">
        <Header title="Welcome to Caledar4U" subtitle="New here? Sign up now!" />
        </Box>
        <Login/>
    </div>

  )
}
export default Homepage
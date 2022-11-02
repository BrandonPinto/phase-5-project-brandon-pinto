import React, { useEffect, useState } from 'react'
import Navbar from './Navbar'
import { Box, Button } from '@mui/material'

export default function CreateEvent() {

  const [allComEvents, setAllComEvents] = useState([])

useEffect(() => {
  fetch('http://localhost:3000/community_events', {
    method: "GET",
    headers: {
      "Content-Type": "application/json"
    },
  }).then((res) => res.json())
  .then(data => console.log(data))
}, [])


  return (
<>
<Navbar/>
    <Box m="20px" display="flex" justifyContent="center">

    </Box>

</>
  )
}

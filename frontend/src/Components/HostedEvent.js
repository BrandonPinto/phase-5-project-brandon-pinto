import React, { useEffect, useState } from 'react'
import Navbar from './Navbar'
import { Box, Button } from '@mui/material'

export default function CreateEvent({ currentUser, setCurrentUser }) {

  const [allCommEvents, setAllCommEvents] = useState([])

  useEffect(() => {
    let token = localStorage.getItem("token")
    if (token) {
      async function getData() {
        let req = await fetch(`http://localhost:3000/community_events`, {
          method: "GET",
          headers: {
            token: token,
            "Content-Type": "application/json",
          },
        })
        let res = await req.json()
        console.log(res)
        if (res) {
          setAllCommEvents(res)
        }
      }
      getData()
      .catch(console.error())
    }
  }, [])

  function handleJoinEvent(event) {
 
    let token = localStorage.getItem("token")
    const createParticipant = async () => {
      let req = await fetch('http://localhost:3000/participants', {
        method: "POST",
        headers: {
          "token": token,
          "Content-Type": "application/json"
        },
        body: JSON.stringify({
          user_id: currentUser.id,
          community_event_id: event.id
        })
      })
      let res = await req.json()
      console.log(res)
      if (req.ok) {
        console.log('hi')
        window.alert(`You have now joined this event!`)
      } else {
        window.alert("You are the host, or you already joined this event.")
      }
    }
    createParticipant()
  }
let handleEventDelete = () => {
  let id = allCommEvents[0].id
  let token = localStorage.getItem("token")
  fetch(`http://localhost:3000/participants/${id}`, {
    method: "DELETE",
    headers: {
      "token": token
    },
    body: JSON.stringify({
      community_event_id: 1
    })
  })
}
  return (
    <>
      <Navbar />
      <button onClick={handleEventDelete}></button>
      <Box mt="20px" fontSize="20px" display="center" justifyContent="center">Community events</Box>
      {allCommEvents.map((event) => {
        return <ul mt="20px" fontSize="20px" display="flex" key={event.id} id={event.id} value={event}>
          <strong>
            <Box fontStyle="italic" fontSize="20px" display="flex" justifyContent="center" marginRight="3%">
              {event.title}
            </Box>
          </strong>
          <Box fontSize="15px" display="flex" justifyContent="center" >
            This event will start on {event.start},
          </Box>
          <Box fontSize="15px" display="flex" justifyContent="center" >
            This event will end on {event.end},
          </Box>
          <Box fontSize="15px" display="flex" justifyContent="center" >
            Minimum amount of people required for this event is {event.min_participant},
          </Box>
          <Box fontSize="15px" display="flex" justifyContent="center">
            Maximum amount of people allowed for this event is {event.max_participant}
          </Box>
          <Box display="flex" justifyContent="center" mt="20px">
            <Button onClick={()=>handleJoinEvent(event)} color="secondary"  variant="contained">
              Join {event.title}
            </Button>
          </Box>
        </ul>
      })}

    </>
  )
}

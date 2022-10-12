import React from 'react'
import FullCalendar from '@fullcalendar/react'
import dayGridPlugin from '@fullcalendar/daygrid'
// import './main.scss' // webpack must be configured to do this


export default function Calendar() {


  return (



    <FullCalendar defaultView="dayGridMonth" plugins={[ dayGridPlugin ]} />


  )
}









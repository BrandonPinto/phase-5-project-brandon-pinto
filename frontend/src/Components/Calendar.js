import React from 'react'
import FullCalendar, {formatDate} from '@fullcalendar/react'
import dayGridPlugin from '@fullcalendar/daygrid'
import timeGridPlugin from '@fullcalendar/timegrid'
import interactionPlugin from '@fullcalendar/interaction'
import listPlugin from '@fullcalendar/list'
import {
    Box,
    List,
    ListItem,
    ListItemText,
    Typography,
    useTheme
} from "@mui/material"


export default function Calendar() {

const handleDateSelect = (selectInfo) => {
    let title = prompt('Please enter a title for your event')
    let calendarApi = selectInfo.view.calendar

    calendarApi.unselect()

    if(title) {
        calendarApi.addEvent({
            title,
            start: selectInfo.startStr,
            end: selectInfo.endStr
        })
        fetch("localhost:3000/calendar", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                title: title,
                start: selectInfo.startStr,
                end: selectInfo.endStr
            })
        })
    }
}




  return (
    <FullCalendar 
    initialView="timeGridMonth"
    headerToolbar={{
        left: "prev, next, today, addEventButton",
        center: "title",
        right: "dayGridMonth, timeGridWeek, timeGridDay"
    }}
    plugins={[dayGridPlugin, timeGridPlugin, interactionPlugin]}
    editable={true}
    selectable={true}
    select={handleDateSelect}
    />
  )
}

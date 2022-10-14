import React, { useState } from 'react'
import FullCalendar, {formatDate} from '@fullcalendar/react'
import dayGridPlugin from '@fullcalendar/daygrid'
import timeGridPlugin from '@fullcalendar/timegrid'
import interactionPlugin from '@fullcalendar/interaction'
import listPlugin from '@fullcalendar/list'
import { tokens } from '../Theme'
import Header from '../Header'

import {
    Box,
    List,
    ListItem,
    ListItemText,
    Typography,
    useTheme
} from "@mui/material"


export default function Calendar() {

const theme = useTheme()
const colors = tokens(theme.palette.mode)
const [currentEvents, setCurrentEvents] = useState([
    {
        id: "5",
        title: "this is a title",
        date: "2022-15-09"
    }
])

const handleDateClick = (selected) => {
    const title = prompt("Please enter a new title for your event")
    const calendarApi = selected.view.calendar
    calendarApi.unselect()

    if(title)
    calendarApi.addEvent({
        id: `${selected.dateStr}-${title}`,
        title,
        start: selected.startStr,
        end: selected.endStr,
        allDay: selected.allDay
    })
}
const handleEventClick = (selected) => {
    if(
        window.confirm(
            `Are you sure you want to delete the event '${selected.event.title}?`
        )
    ) {
        selected.event.remove()
    }
}

return (

<Box m="20px">
    <Header title="CALENDAR" subtitle="Full Calendar Interactive Page" />
    
    <Box display="flex" justifyContent="space-between">
            {/* profile component will go here */}
        <Box className="invisible-scrollbar"
            style={{height: 400, display:'flex', flexDirection:'column', alignItems:'center', overflowY: "scroll"
            }}
            flex="1 1 20%"
            backgroundColor={colors.primary[400]}
            p="5px"
            borderRadius="5px"
            scrollbarColor= {colors.primary[400]}
            >
            <Typography sx={{
                textAlign: "center",
                fontSize: "20px"
            }}
            variant="h5">Your Events</Typography>
            <List sx={{
                width: "90%"
            }}>
                {currentEvents.map((event) =>   (
                <ListItem
                key={event.id}
                sx={{backgroundColor:
                    colors.greenAccent[500],
                    margin: "10px 0",
                    borderRadius: "50px",
                    padding: '4px 20px',
                    textAlign: "center",
                    wordWrap: "break-word",
                    flex: "1 1 100%"
                }}
                    >
                        {/* each item will contain each part of the users information 
                        based on what their events are-- change accordingly */}
                        <ListItemText
                        primary= {
                            <Typography sx={{
                                marginTop:"-2px",
                                fontSize: "14px",
                                lineHeight: "1",
                                marginBottom: "5px"
                            }}>
                                {event.title}
                            </Typography>
                        }

                     
                        secondary={
                            <Typography    sx={{
                                fontSize: "10px",
                                lineHeight: "0.5"
                            }}>
                                {formatDate(event.start, {
                                    year: "numeric",
                                    month: "short",
                                    day: "numeric"
                                })}
                            </Typography>
                        }
                        />
                    </ListItem>
                ))}
            </List>
        </Box>
        <div className="space"></div>
        <Box className="invisible-scrollbar"
            style={{height: 400, display:'flex', flexDirection:'column', alignItems:'center', overflowY: "scroll"
            }}
            flex="1 1 20%"
            backgroundColor={colors.primary[400]}
            p="5px"
            borderRadius="5px"
            scrollbarColor= {colors.primary[400]}
            >
            <Typography sx={{
                textAlign: "center",
                fontSize: "20px"
            }}
            variant="h3">Community Events</Typography>
            <List sx={{
                width: "90%"
            }}>
                {currentEvents.map((event) =>   (
                <ListItem
                key={event.id}
                sx={{backgroundColor:
                    colors.greenAccent[500],
                    margin: "10px 0",
                    borderRadius: "50px",
                    padding: '4px 20px',
                    textAlign: "center",
                    wordWrap: "break-word",
                    flex: "1 1 100%"
                }}
                    >
                        {/* each item will contain each part of the users information 
                        based on what their events are-- change accordingly */}
                        <ListItemText
                        primary= {
                            <Typography sx={{
                                marginTop:"-2px",
                                fontSize: "14px",
                                lineHeight: "1",
                                marginBottom: "5px"
                            }}>
                                {event.title}
                            </Typography>
                        }
                        secondary={
                            <Typography    sx={{
                                fontSize: "10px",
                                lineHeight: "0.5"
                            }}>
                                {formatDate(event.start, {
                                    year: "numeric",
                                    month: "short",
                                    day: "numeric"
                                })}
                            </Typography>
                        }
                        />
                    </ListItem>
                ))}
            </List>
        </Box>
        {/* {CALENDAR} */}
        <Box flex="1 1 100%" ml="40px">
            <FullCalendar
            flex="1 1 100%"
            height="75vh"
            plugins={[
                dayGridPlugin,
                timeGridPlugin,
                interactionPlugin,
                listPlugin
            ]}
            headerToolbar={{
                left: "prev,next today",
                center: "title",
                right: "dayGridMonth,timeGridWeek,timeGridDay,listMonth"
            }}
            initialView="dayGridMonth"
            editable={true}
            selectable={true}
            selectMirror={true}
            dayMaxEvents={true}
            select={handleDateClick}
            eventClick={handleEventClick}
            eventsSet={(events) => setCurrentEvents(events)}
            initialEvents={[{id: "55", title: "do this", date: "2022-08-14"}]}
            // initialEvents={[this will contain currentUser.events && currentUser.calendar]}
            />
        </Box>
    </Box>
</Box>
    )
}

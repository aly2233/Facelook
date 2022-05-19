import React from 'react';
import ProfileInfoContainer from './profile_info_container';
import ProfileHeaderContainer from './profile_header_container';


class Profile extends React.Component{
    constructor(props) {
        super(props)
    }

    componentDidMount(){
        this.props.fetchUser(this.props.match.params.userId);
        this.props.fetchUsers();
        window.scrollTo(0, 0);
    }

    render(){
        return(
            <div className='profile-page'>
                <div className='profile-container'>
                    <ProfileHeaderContainer/>
                    <ProfileInfoContainer/>
                </div>
            </div>
        )
    }
}

export default Profile;
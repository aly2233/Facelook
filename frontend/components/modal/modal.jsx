import React from 'react';
import SignupContainer from '../session/signup_container';
import PostCreateContainer from '../post/post_create_container';
import PostEditContainer from '../post/post_edit_container';
import ProfileEditContainer from '../profile/profile_edit_container';
import { closeModal } from '../../actions/modal_actions';
import { connect } from 'react-redux'

function Modal({ modal, closeModal }) {
    if (!modal) {
        return null
    }

    let component;

    switch (modal) {
        case 'signup':
            component = <SignupContainer closeModal={closeModal}/>;
            break;
        case 'Create Post':
            component = <PostCreateContainer/>;
            break;
        case 'Update Post':
            component = <PostEditContainer closeModal={closeModal} id={modal.id}/>;
            break;
        case 'Update Info':
            component = <ProfileEditContainer closeModal={closeModal} id={modal.id}/>;
            break;
        default:
            return null;
    }

    return (
        <div className="modal-background">
            <div className="modal-child" onClick={e => e.stopPropagation()}>
                { component }
            </div>
        </div>
    )
}

const mapStateToProps = state => {
    return {
      modal: state.ui.modal,
    };
  };
  
  const mapDispatchToProps = dispatch => {
    return {
      closeModal: () => dispatch(closeModal())
    };
  };
  
export default connect(mapStateToProps, mapDispatchToProps)(Modal);

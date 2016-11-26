
No migrations yet done



add_reference :employer, :job_posting, index: true, foreign_key: true

    add_reference :seeker, :job_application, index: true, foreign_key: true
    add_reference :job_posting, :job_application, index: true, foreign_key: true   



## Support & Documentation

Visit http://docs.c9.io for support, or to learn more about using Cloud9 IDE. 
To watch some training videos, visit http://www.youtube.com/user/c9ide

FROM jupyter/minimal-notebook

USER $NB_UID

RUN conda config --add channels conda-forge &&\
    conda install gnuplot octave octave_kernel texinfo

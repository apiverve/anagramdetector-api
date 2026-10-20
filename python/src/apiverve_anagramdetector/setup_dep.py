from setuptools import setup, find_packages

setup(
    name='apiverve_anagramdetector',
    version='1.2.2',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Anagram Detector checks whether two words or phrases are anagrams of each other. Submit two strings to receive a true or false match verdict, cleaned comparison text, and character counts with options to ignore letter case and spaces.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/anagramdetector?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)

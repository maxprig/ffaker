# encoding: utf-8

module Faker

  # Format for swedish numbers, from here
  # from http://sv.wikipedia.org/wiki/Telefonnummer
  #
  # All area codes are from this list
  # http://sv.wikipedia.org/wiki/Lista_%C3%B6ver_svenska_riktnummer
  #
  # - Length 9
  #   08-xxx xxx xx, 0xx-xxx xx xx, 0xxx-xx xx xx
  # - Length 8
  #   08-xxx xx xx, 0xx-xx xx xx, 0xxx-xxx xx
  # - Length 7
  #   08-xx xx xx, 0xx-xxx xx
  #
  module PhoneNumberSE
    extend ModuleUtils
    extend self

    def phone_number
      case rand(2)
      when 0 then home_work_phone_number
      when 1 then mobile_phone_number
      end
    end

    def home_work_phone_number
      Faker.numerify("0#{phone_number_format}")
    end

    def mobile_phone_number
      Faker.numerify("0#{mobile_phone_number_format}")
    end

    def international_phone_number
      case rand(2)
      when 0 then international_mobile_phone_number
      when 1 then international_home_work_phone_number
      end
    end

    def country_prefix
      COUNTRY_PREFIX.rand
    end

    def international_mobile_phone_number
      Faker.numerify("#{country_prefix} (0)#{mobile_phone_number_format}")
    end

    def international_home_work_phone_number
      Faker.numerify("#{country_prefix} (0)#{phone_number_format}")
    end

    def area_prefix
      PHONE_PREFIX.rand
    end

    def phone_number_format
      prefix = area_prefix
      case prefix.length
        when 1 then PHONE_FORMAT_PREFIX_2.rand
        when 2 then PHONE_FORMAT_PREFIX_3.rand
        when 3 then PHONE_FORMAT_PREFIX_4.rand
      end % prefix
    end

    def mobile_prefix
      MOBILE_PHONE_PREFIX.rand
    end

    def mobile_phone_number_format
      MOBILE_PHONE_FORMAT.rand % mobile_prefix
    end

    PHONE_FORMAT_PREFIX_2 = k ["%s-### ### ##",
                               "%s-### ## ##",
                               "%s-## ## ##"]
    PHONE_FORMAT_PREFIX_3 = k ["%s-### ## ##",
                               "%s-## ## ##",
                               "%s-## ###"]
    PHONE_FORMAT_PREFIX_4 = k ["%s-## ## ##",
                               "%s-### ##"]

    MOBILE_PHONE_FORMAT = k ["%s#-## ## ##", "%s#-######"]
    COUNTRY_PREFIX = k ["+46", "0046"]
    MOBILE_PHONE_PREFIX = k %w(70 72 73 76 74)

    PHONE_PREFIX = k %w(8 11 120 121 122 123 125 13 140 141 142 143 144 150 151
                        152 155 156 157 158 159 16 171 173 174 175 176 18 19 21
                        220 221 222 223 224 225 226 227 23 240 241 243 246 247
                        248 250 251 253 258 26 270 271 278 280 281 290 291 292
                        293 294 295 297 300 301 302 303 304 31 320 321 322 325
                        33 340 345 346 35 36 370 371 372 380 381 382 383 390
                        392 393 40 410 411 413 414 415 416 417 418 42 430 431
                        433 435 44 451 454 455 456 457 459 46 470 471 472 474
                        476 477 478 479 480 481 485 486 490 491 492 493 494 495
                        496 498 499 500 501 502 503 504 505 506 510 511 512 513
                        514 515 520 521 522 523 524 525 526 528 530 531 532 533
                        534 54 550 551 552 553 554 555 560 563 564 565 570 571
                        573 580 581 582 583 584 585 586 587 589 590 591 60 611
                        612 613 620 621 622 623 624 63 640 642 643 644 645 647
                        650 651 652 653 657 660 661 662 663 670 671 672 680 682
                        684 687 690 691 692 693 695 696 8 90 910 911 912 913
                        914 915 916 918 920 921 922 923 924 925 926 927 928 929
                        930 932 933 934 935 940 941 942 943 950 951 952 953 954
                        960 961 970 971 973 975 976 977 978 980 981)

  end
end
